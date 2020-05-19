import 'package:flutter/material.dart';
import 'package:mercadona/src/models/product_list_model.dart';

class ProductItemList extends StatefulWidget {

  final ProductListModel product;

  const ProductItemList(this.product);

  @override
  _ProductItemListState createState() => _ProductItemListState();
}

class _ProductItemListState extends State<ProductItemList> {

  int _count;
  double _price;
  double _amount;
  bool _purchased;

  @override
  void initState() {
    _purchased =  widget.product.purchased || false;
    _count = widget.product.count;
    _price = widget.product.price;
    _amount = widget.product.amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: (_purchased) ? Colors.grey[100] : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.product.title, style: Theme.of(context).textTheme.subtitle1, maxLines: 2, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5),
                      Text(widget.product.category, style: Theme.of(context).textTheme.caption, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                (_purchased) ? Text('Comprado', style: Theme.of(context).textTheme.bodyText2)
                : IconButton(
                  onPressed: () {
                    setState(() {
                      _purchased = !_purchased;
                    });
                  }, 
                  icon: Icon(Icons.done, color: Theme.of(context).primaryColor)
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.network(
                    'https://prod-mercadona.imgix.net/images/66ed0028e21f5e231a920f57feb72445.jpg?fit=crop&h=300&w=300',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover
                  ),
                ),
                Expanded(
                  child:(_purchased) ? Container() : Container(
                    height: 80,
                    child: Column(
                      children: <Widget>[
                        Text('Cantidad', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        _bottonsCount(),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('$_amount €', style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 5),
                      Text('$_price €/unidad', style: Theme.of(context).textTheme.caption, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ],
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottonsCount(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: (){
            setState(() {
              _count -= (_count > 0) ? 1 : 0;
            });
            _calculateAmount();
          },
        ),
        Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Text(_count.toString(), 
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            setState(() {
              _count += 1;
            });
            _calculateAmount();
          },
        )
      ]
    );

  }

  void _calculateAmount(){

    setState(() {
      _amount = (_count * _price);
    });
    print(_amount);
  }
}