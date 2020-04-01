import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider/common/theme.dart';
import 'package:shop_provider/models/cart.dart';
import 'package:shop_provider/models/catalog.dart';
import 'package:shop_provider/screens/login.dart';
import 'package:shop_provider/screens/cart.dart';
import 'package:shop_provider/screens/catalog.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              cart.catalog = catalog;
              return cart;
            },
          )
        ],
      child: MaterialApp(
        title: 'SHOP',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart()
        },
      ),
    );
  }
}
