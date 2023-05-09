import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:millet_recipe_app/views/recipeDetail/recipeDetails.dart';
import 'package:millet_recipe_app/views/recipeList/recipeList_constants.dart';
import 'package:millet_recipe_app/widgets/searchBar.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key, required this.milletName});
  final String milletName;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Map<String, String>> recipeList2 = recipeList;
  int selectOption = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Expanded(
                    child: Text(
                      widget.milletName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBar(controller: _controller),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  itemCount: options.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          selectOption = index;
                          setState(() {
                            selectOption;
                            if (selectOption == 0) {
                              recipeList2 = recipeList;
                            } else {
                              recipeList2 = recipeList
                                  .where((element) =>
                                      element['category'] ==
                                      options[selectOption])
                                  .toList();
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: (selectOption == index)
                                ? Colors.purple
                                : const Color.fromARGB(28, 155, 39, 176),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Center(
                              child: Text(
                                options[index],
                                style: TextStyle(
                                  color: (selectOption == index)
                                      ? Colors.white
                                      : Colors.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Scrollbar(
                  child: MasonryGridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    itemCount: recipeList2.length,
                    itemBuilder: (context, index) {
                      final String recipeName =
                          recipeList2[index]['recipeName']!;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetail(recipeName: recipeName),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl: recipeList2[index]
                                      ['recipeImageUrl']!,
                                  placeholder: (context, url) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    recipeName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
