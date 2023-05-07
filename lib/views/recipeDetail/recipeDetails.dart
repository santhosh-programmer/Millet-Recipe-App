import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/favourites/favList.dart';

import '../recipeList/recipeList_constants.dart';
import 'package:video_player/video_player.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    Key? key,
    required this.recipeName,
    required this.ingredients,
    this.image,
  }) : super(key: key);

  final String recipeName;
  final List<String> ingredients;
  final String? image;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late VideoPlayerController _videoPlayerController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _videoPlayerController.pause();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = widget.image ?? '';
    for (var recipe in recipeList) {
      if (recipe['recipeName'] == widget.recipeName) {
        imageUrl = recipe['recipeImageUrl']!;
        break;
      }
    }
    print(widget.recipeName);
    print(imageUrl);
    // print(favList[0]);
    bool isFav = false;
    int favIndex = -1;
    for (var i = 0; i < favList.length; i++) {
      if (favList[i]['recipeName'] == widget.recipeName) {
        isFav = true;
        favIndex = i;
        break;
        // break;
      }
    }
    print(isFav);
    // isFav = true;

    return Scaffold(
      extendBody: _isVideoInitialized,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (imageUrl.isNotEmpty)
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(
                              color: Colors.black.withOpacity(0.4),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Text(
                                widget.recipeName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ingredients:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        (isFav == true)
                            ? IconButton(
                                onPressed: () {
                                  // favList.remove({'recipeName': widget.recipeName, 'recipeImageUrl': imageUrl});
                                  favList.removeAt(favIndex);
                                  // isFav = false;
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Removed from Favourites')));
                                  setState(() {
                                    // isFav;
                                    favList;
                                  });
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  favList.add({'recipeName': widget.recipeName, 'recipeImageUrl': imageUrl});
                                  // isFav = true;
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to  Favourites')));
                                  setState(() {
                                    // isFav;
                                    favList;
                                  });
                                },
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              )
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: widget.ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '- ${widget.ingredients[index]}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20), // Add some spacing between the ingredients and benefits
                    const Text(
                      'Benefits:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '\n1. Ragi millet is naturally gluten-free, low in fat, and highly alkaline grain. It is easy to digest.\n\n2. Ragi has a low glycemic index and is high in dietary fiber. It improves digestion, helps in controlling diabetes, and aids in weight loss.\n\n3. It is a rich source of iron, calcium, Vitamin D, and amino acid. It helps in battling anemia and also anxiety and insomnia.',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Tutorial Video :',
              style: TextStyle(
                fontSize: 18,
                height: 1.7,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                  IconButton(
                    icon: Icon(
                      _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _videoPlayerController.value.isPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
