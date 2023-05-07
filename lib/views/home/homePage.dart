import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/home/homePage_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:millet_recipe_app/views/favourites/favouritesPage.dart';
import 'package:millet_recipe_app/views/profile/profilePage.dart';
import 'package:millet_recipe_app/views/recipeList/recipeList.dart';
import 'package:millet_recipe_app/widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple,
                    ),
                    child: const Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritesPage()));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                    },
                    icon: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBar(controller: _controller),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: milletList.length,
                  itemBuilder: (context, index) {
                    final milletName = milletList[index]['name']!;
                    final milletImageUrl = milletList[index]['imageUrl'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeList(milletName: milletName),
                              ));
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                            ),
                          ),
                          elevation: 12,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                width: double.infinity,
                                height: 150,
                                imageUrl: milletImageUrl!,
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                    ),
                                    // color: Colors.white70,
                                    color: Colors.black45,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      milletName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
