import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mercadona/src/models/list_model.dart';
import 'package:mercadona/src/models/product_list_model.dart';

import '../models/product_list_model.dart';
import '../models/product_model.dart';

class ShoppingProvider {


  static Future<ShoppingListModel> newList(String title) async {

    ShoppingListModel list;
    final Uri url = Uri.parse('https://europe-west2-despensa-app-munity.cloudfunctions.net/api/list');
    final  resp = await http.post(url,body: {
      'title'    : title,
    });
    list = new ShoppingListModel.fromJson(json.decode( resp.body ));
    return list;
  }

  static Future<List<ShoppingListModel>> getLists() async {

    List<ShoppingListModel> lists;
    final Uri url = Uri.parse('https://europe-west2-despensa-app-munity.cloudfunctions.net/api/list');
    final  resp = await http.get(url);
    lists = listModelFromJson( resp.body );
    return lists;
  }

  static Future<List<ProductListModel>> getProductsList(String listId) async {

    List<ProductListModel> items;
    final Uri url = Uri.parse('https://europe-west2-despensa-app-munity.cloudfunctions.net/api/products/$listId');
    final  resp = await http.get(url);
    items = productListModelFromJson( resp.body );
    return items;
  }

  static Future<ProductModel> getProductByEan(String ean) async {

    ProductModel product;
    final Uri url = Uri.parse('https://europe-west2-despensa-app-munity.cloudfunctions.net/api/ean/$ean');
    final  resp = await http.get(url);
    product = new ProductModel.fromJson(json.decode( resp.body ));
    return product;
  }
}