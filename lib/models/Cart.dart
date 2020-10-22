import 'dart:collection';

import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final int price;
  final String imgUrl;

  Cart(
      {@required this.id,
      @required this.title,
      @required this.number,
      @required this.price,
      @required this.imgUrl});
}

class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.number;
    });
    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (ex) => Cart(
              id: ex.id,
              title: ex.title,
              price: ex.price,
              imgUrl: ex.imgUrl,
              number: ex.number + 1));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: '${DateTime.now()}',
              title: title,
              price: price,
              imgUrl: imgUrl,
              number: 1)); // найти значение ключа или добавить если его там нет
    notifyListeners();
    }
  }
  void deleteItem(String productId){
    _cartItems.remove(productId);
    notifyListeners();
  }
  void clear(){
    _cartItems = {};
    notifyListeners();
  }
}
