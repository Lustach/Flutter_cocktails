import 'dart:collection';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final num price;
  final color;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imgUrl,
    @required this.price,
    @required this.color,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p3',
        title: 'Жёлтый взрыв счастья',
        description:
        'Ты получишь настоящее удовольствие, когда попробуешь этот напиток',
        imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2012/09/cucumber-cooler-cocktails-minimalist-baker.jpg',
        color: '0xFFFFFF59D',
        price: 150),
    Product(
        id: 'p2',
        title: 'Жёлтый взрыв счастья',
        description:
        'Ты получишь настоящее удовольствие, когда попробуешь этот напиток',
        imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2012/08/Adult-Watermelon-Limeades.jpg',
        color: '0xFFC51162',
        price: 150),
    Product(
        id: 'p1',
        title: 'Жёлтый взрыв счастья',
        description:
        'Ты получишь настоящее удовольствие, когда попробуешь этот напиток',
        imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2013/05/Lime-Watermelon-Margaritas.jpg',
        color: '0xFF76FF03',
        price: 150),
    Product(
        id: 'p4',
        title: 'Жёлтый взрыв счастья',
        description:
        'Ты получишь настоящее удовольствие, когда попробуешь этот напиток',
        imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2017/12/AMAZING-Orange-Whiskey-Ginger-with-Mint-A-7-ingredient-refreshing-naturally-sweetened-cocktail-perfect-for-NYE-and-beyond-NYE-cocktail-bourbon-ginger-orange-mint-minimalistbaker-recipe-41.jpg',
        color: '0xFF00796B',
        price: 150),
    Product(
        id: 'p5',
        title: 'Жёлтый взрыв счастья',
        description:
        'Ты получишь настоящее удовольствие, когда попробуешь этот напиток',
        imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2015/03/SWEET-southing-Chili-Cinnamon-Hot-Toddy-with-Bourbon-and-Lemon-Just-7-ingredients-and-naturally-sweetened.jpg',
        color: '0xFF0277BD',
        price: 150),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
