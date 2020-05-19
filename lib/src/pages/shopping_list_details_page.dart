import 'package:flutter/material.dart';
import 'package:mercadona/src/models/list_model.dart';
import 'package:mercadona/src/models/product_list_model.dart';
import 'package:mercadona/src/providers/shopping_provider.dart';
import 'package:mercadona/src/widgets/product_item_list_widget.dart';
import 'package:barcode_scan/barcode_scan.dart';

import '../models/product_list_model.dart';
import '../models/product_model.dart';
import '../models/product_model.dart';
import '../providers/shopping_provider.dart';


class ShoppingListDetailsPage extends StatefulWidget {
  
  final ShoppingListModel list;
  const ShoppingListDetailsPage(this.list);

  @override
  _ShoppingListDetailsPageState createState() => _ShoppingListDetailsPageState();
}

class _ShoppingListDetailsPageState extends State<ShoppingListDetailsPage> {

  List<ProductListModel> products;

  @override
  void initState() {
    products = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(widget.list.title, style: TextStyle(color: Colors.white),)
      ),
      body: FutureBuilder(
        future: ShoppingProvider.getProductsList(widget.list.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){

          products.clear();

          if(!snapshot.hasData){
              return Center( child: CircularProgressIndicator());
          }else{
            if(snapshot.data.length == 0) {
              return Center( child: Text('No hay productos en la lista'));
            }else{

              products.addAll(snapshot.data);
              return  ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index){
                  return ProductItemList(products[index]);
                }
              );
            }
          }

          
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await BarcodeScanner.scan();
          if(result.type == ResultType.Barcode){
            String ean = result.rawContent;
            ProductModel _product = await ShoppingProvider.getProductByEan(ean);
            CategoryProduct category = _product.categories.last;
            print(_product.displayName);
          

            Map<String, dynamic> data = {
              'id': _product.id,
              'title': _product.displayName,
              'amount': double.parse(_product.priceInstructions.unitPrice),
              'price': double.parse(_product.priceInstructions.unitPrice),
              'count': 1,
              'productId': _product.displayName,
              'category': category.name,
              'image': _product.photos[0].regular
            };
            print(data);

            ProductListModel newProduct = await ShoppingProvider.newProductToList(data, widget.list.id);
            print(newProduct);
            setState(() {
              products.add(newProduct);
            });
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon( Icons.add_shopping_cart),
      ),
    );
  }


}