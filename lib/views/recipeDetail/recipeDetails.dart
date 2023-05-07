import 'package:flutter/material.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.recipeName});
  final String recipeName;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.recipeName,
        ),
      ),
    );
  }
}
