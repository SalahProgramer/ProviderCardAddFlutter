import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraddcard/cart.dart';

import 'home.dart';
void main() {
  runApp(ChangeNotifierProvider(create: (context) => Cart(),child: MaterialApp(

    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    home: home(),


  ),));
}


