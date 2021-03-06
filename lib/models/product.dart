import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  
  @required final String? id;
  @required final String? title;
  @required final String? description;
  @required final double? price;
  @required final String? imageUrl;
  bool isFavorite = false;

  Product({this.id, this.title, this.description, this.price, this.imageUrl});

  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
