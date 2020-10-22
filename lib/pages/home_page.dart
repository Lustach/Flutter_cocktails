import 'package:flutter/material.dart';
import 'package:my_first_flutter_proj/models/product.dart';
import 'package:my_first_flutter_proj/widgets/bottom_bar.dart';
import 'package:my_first_flutter_proj/widgets/catalog.dart';
import 'package:my_first_flutter_proj/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height - 85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  )),
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Container(
                    child: ListTile(
                      title: Text('Освежающие напитки',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'Больше чем 100 видов коктейлей',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(Icons.panorama_horizontal),
                    ),
                  ),
                  Container(
                    height: 290,
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData.items.length,
                        itemBuilder: (context, int index) =>
                            ChangeNotifierProvider.value(
                              value: productData.items[index],
                              child: ItemCard(),
                            )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Каталог коктейлей')),
                  ...productData.items.map((value) {
                    return CatalogListTile(imgUrl: value.imgUrl);
                  }).toList(),
                ],
              ))),
      bottomNavigationBar: BottomBar(),
    );
  }
}
