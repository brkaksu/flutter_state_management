import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/orders.dart';
import 'package:flutter_state_management/providers/products.dart';
import 'package:flutter_state_management/screens/cart_screen.dart';
import 'package:flutter_state_management/screens/orders_screen.dart';
import 'package:flutter_state_management/screens/product_detail_screen.dart';
import 'package:flutter_state_management/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme:
                ThemeData().colorScheme.copyWith(secondary: Colors.deepOrange)),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
