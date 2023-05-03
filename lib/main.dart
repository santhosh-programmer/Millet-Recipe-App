import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/home/homePage.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Millet Recipe App',
      home: HomePage(),
    ),
  );
}
