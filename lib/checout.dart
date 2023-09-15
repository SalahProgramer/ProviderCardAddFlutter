import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraddcard/item.dart';

import 'cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
        centerTitle: true,
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.basket.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                trailing: IconButton(
                  icon: Icon(
                    Icons.cleaning_services,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    cart.delchangeNum();
                    cart.remove(cart.basket[index]);
                    // value.add(value.items[index]);
                  },
                ),
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(cart.basket[index].name),
                subtitle: Text(cart.basket[index].price.toString()),
              ));
            },
          );
        },
      ),
    );
  }
}
