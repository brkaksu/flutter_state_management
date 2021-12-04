import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/providers/cart.dart';
import 'package:flutter_state_management/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
          },
          child: Image.network(product.imageUrl!, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) {
              return IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Colors.blue,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              );
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
               cart.addItem(product.id!, product.price!, product.title!);
            },
            color: Colors.red,
          ),
          backgroundColor: Colors.black87,
          title: Text(product.title!, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
