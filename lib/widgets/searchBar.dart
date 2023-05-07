import 'package:flutter/material.dart';
import 'package:millet_recipe_app/widgets/searchDelegate.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    // List<String> results = [];
    // return Stack(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: const Color.fromARGB(69, 194, 194, 194),
    //       ),
    //       child: TextField(
    //         onTap: () {
    //           showSearch(
    //             context: context,
    //             delegate: CustomSearchDelegate(),
    //           );
    //         },
    //         // onChanged: (value) {
    //         //   for (var element in recipeList) {
    //         //     if (element['recipeName']!.toLowerCase().contains(value.toLowerCase())) results.add(element['recipeName']!);
    //         //     setState(() {
    //         //       results;
    //         //     });
    //         //   }
    //         //   print(results);
    //         // },
    //         controller: widget.controller,
    //         cursorColor: Colors.black,
    //         decoration: const InputDecoration(
    //           prefixIcon: Icon(
    //             Icons.search,
    //             color: Colors.black,
    //           ),
    //           hintText: 'Search',
    //           contentPadding: EdgeInsets.all(12),
    //           hintStyle: TextStyle(
    //             fontSize: 20,
    //           ),
    //           enabledBorder: InputBorder.none,
    //           focusedBorder: InputBorder.none,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(69, 194, 194, 194),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.search,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Search',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(176, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
