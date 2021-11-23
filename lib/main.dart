import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/products.dart';
import 'package:flutter_state_management/screens/product_detail_screen.dart';
import 'package:flutter_state_management/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.deepOrange)
        ),
        home: ProductOverviewScreen(),
        
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
