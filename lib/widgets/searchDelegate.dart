import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/recipeDetail/recipeDetails.dart';
import 'package:millet_recipe_app/views/recipeList/recipeList_constants.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = [];
    print(recipeList.length);
    print(results.length);
    for (var i = 0; i < recipeList.length / 2; i++) {
      if (recipeList[i]['recipeName']!.toLowerCase().contains(query.toLowerCase())) {
        results.add(
          recipeList[i]['recipeName']!,
        );
      }
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(recipeName: results[index]),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Text(results[index]),
              ),
              const Divider(
                color: Colors.black38,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
