import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/recipeList/recipeList.dart';
import 'favList.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.3;
    if (favList.isNotEmpty) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Favourites',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favList.length,
                  itemBuilder: (context, index) {
                    final String recipeName = favList[index]['recipeName']!;
                    final String recipeImageUrl = favList[index]['recipeImageUrl']!;
                    return Stack(
                      alignment: (index % 2 == 0) ? Alignment.centerLeft : Alignment.centerRight,
                      children: [
                        Container(
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: (index % 2 == 0)
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(size),
                                    bottomLeft: Radius.circular(size),
                                    topRight: const Radius.circular(20),
                                    bottomRight: const Radius.circular(20),
                                  )
                                : BorderRadius.only(
                                    topRight: Radius.circular(size),
                                    bottomRight: Radius.circular(size),
                                    topLeft: const Radius.circular(20),
                                    bottomLeft: const Radius.circular(20),
                                  ),
                            gradient: LinearGradient(
                              // begin: const AlignmentDirectional(0, 50),
                              // end: const AlignmentDirectional(100, 100),
                              colors: [
                                if (index % 2 == 0) Colors.white,
                                const Color.fromARGB(255, 33, 177, 243),
                                Colors.blue,
                                const Color.fromARGB(255, 33, 95, 243),
                                const Color.fromARGB(255, 33, 55, 243),
                                // const Color.fromARGB(255, 46, 58, 183),
                                // const Color.fromARGB(255, 81, 58, 183),
                                if (index % 2 == 1) Colors.white,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: (index % 2 == 0)
                                ? EdgeInsets.only(
                                    left: size + 16,
                                    right: size / 4,
                                  )
                                : EdgeInsets.only(
                                    right: size + 16,
                                    left: size / 4,
                                  ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    recipeName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    // softWrap: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(size),
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(size),
                                // border: Border.all(
                                //   // color: const Color.fromARGB(255, 23, 74, 243),
                                //   width: 2,
                                // ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CachedNetworkImage(
                                  width: size,
                                  height: size,
                                  imageUrl: recipeImageUrl,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(size / 2),
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
                              ),
                            ),
                          ),
                        ),
                        (index % 2 == 0)
                            ? Positioned(
                                right: 0,
                                // bottom: 20,
                                child: Container(
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(size),
                                        bottomLeft: Radius.circular(size),
                                      )),
                                  child: InkWell(
                                    onTap: () {
                                      favList.removeAt(index);
                                      setState(() {
                                        favList;
                                      });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 0,
                                // bottom: 20,
                                child: Container(
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(size),
                                      bottomRight: Radius.circular(size),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      favList.removeAt(index);
                                      setState(() {
                                        favList;
                                      });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            children: [
              const Text(
                'Your Favourites',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecipeList(milletName: 'dummy'),
                        )).then((value) {
                      setState(() {
                        favList;
                      });
                    });
                  },
                  child: Card(
                    // color: Colors.,
                    elevation: 6,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
