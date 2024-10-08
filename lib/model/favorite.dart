// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:doorsandwindows/model/products.dart';



class FavoriteMeals {
  final Products products;
  final String userName;

  FavoriteMeals({required this.products, required this.userName});

  @override
  bool operator ==(covariant FavoriteMeals other) {
    if (identical(this, other)) return true;

    return other.products == products && other.userName == userName;
  }

  @override
  int get hashCode => products.hashCode ^ userName.hashCode;
}

List<FavoriteMeals> userFavoriteMeals = [];

void adduserFavoriteMeals({
  required String userName,
  required Products products,
}) {
  final newDetails = FavoriteMeals(userName: userName, products: products);

  if (isFavorite(userName: userName, products: products)) {
    userFavoriteMeals.removeWhere((element) => element == newDetails);
  } else {
    userFavoriteMeals.add(newDetails);
  }
}

bool isFavorite({
  required String userName,
  required Products products,
}) {
  final newDetails = FavoriteMeals(userName: userName, products: products);
  return userFavoriteMeals.contains(newDetails);
}
