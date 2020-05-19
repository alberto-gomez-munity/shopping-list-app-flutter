import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercadona/src/models/list_model.dart';
import 'package:mercadona/src/pages/shopping_list_details_page.dart';
import 'package:mercadona/src/providers/shopping_provider.dart';

class ShoppingListPage extends StatefulWidget {

  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final _formKey = GlobalKey<FormState>();  

  List<ShoppingListModel> lists;

  @override
  void initState() {
    lists = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int _currentPage = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de la compra', style: TextStyle(color: Colors.white),)
      ),
      body: FutureBuilder(
        future: ShoppingProvider.getLists(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          
          lists.clear();

          if(!snapshot.hasData){
              return Center( child: CircularProgressIndicator());
          }else{

            if(snapshot.data.length == 0) {
              return Center( child: Text('No hay listas de la compra'));
            }else{

              lists.addAll(snapshot.data);

              return ListView.builder(
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index){

                  String listNumber = (index + 1).toString();
                  ShoppingListModel list = lists[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal:10, vertical:5),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(listNumber, style: TextStyle(color: Colors.white, fontSize: 14)),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(list.title),
                      subtitle: Text(DateFormat.yMMMMd("es").format(list.created).toString()),
                      trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor),
                      onTap: (){
                        print(listNumber);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingListDetailsPage(list)));
                      },
                    ),
                  );
                }
              );
            }
          }

          
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Listas')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            title: Text('Despensa')
          ),
        ]
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: Icon( Icons.add_shopping_cart),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Nueva lista de la compra"),
          content: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: TextFormField(
                autofocus: true,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Nombre de la lista',
                ),
                //validator: (value) => _validateNameSurname(value),
                onSaved: (value) async {
                  ShoppingListModel newList = await ShoppingProvider.newList(value);
                  setState(() {
                    lists.add(newList);
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Guardar"),
              onPressed: () {
                _formKey.currentState.save();
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}