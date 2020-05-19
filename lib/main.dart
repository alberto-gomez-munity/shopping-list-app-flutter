import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
//pages
import 'package:mercadona/src/pages/shopping_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    initializeDateFormatting("es_ES", null).then((_) {
      //print(DateFormat().locale);
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(33, 184, 134, 1),
        scaffoldBackgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      initialRoute: 'shopping-list',
      routes: {
        'shopping-list': (BuildContext context) => ShoppingListPage()
      },
    );
  }
}
