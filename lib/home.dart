import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'checout.dart';
import 'item.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<item> items = [
    item(name: "samasung", price: 500),
    item(name: "Iphone", price: 1000),
    item(name: "nokia", price: 250)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          Consumer<Cart>(
            builder: (context, Cart, child) {
              return Badge(
                  backgroundColor: Colors.green,
                  isLabelVisible: true,
                  alignment: Alignment.center,
                  offset: Offset(4, 3),
                  label: Text(Cart.num.toString()),
                  largeSize: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Checkout(),
                        ));
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                      )));
            },
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          value.changeNum();
                          value.add(items[index]);
                        },
                      ),
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(items[index].name),
                      subtitle: Text(items[index].price.toString()),
                    );
                  },
                ),
              );
            },
          )),
    );
  }
}
