import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/cart.dart';
import 'package:flutter_state_management/providers/products.dart';
import 'package:flutter_state_management/widgets/app_drawer.dart';
import 'package:flutter_state_management/widgets/badge.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  final selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop"), actions: popUpMenuItems()),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  List<Widget> popUpMenuItems() {
    return <Widget>[
      PopupMenuButton(
        onSelected: (FilterOptions selectedValue) {
          setState(() {
            if (selectedValue == FilterOptions.Favorites) {
              _showOnlyFavorites = true;
            } else {
              _showOnlyFavorites = false;
            }
          });
          print(selectedValue);
        },
        icon: Icon(Icons.more_vert),
        itemBuilder: (_) => [
          PopupMenuItem(
              child: Text('Only Favorites'), value: FilterOptions.Favorites),
          PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
        ],
      ),
      Consumer<Cart>(
        builder: (_, cart, ch) => Badge(
          child: ch,
          value: cart.itemCount.toString(),
        ),
        child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
        ),
      ),
    ];
  }
}
