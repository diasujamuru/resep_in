import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resep_in/pages/focus_recipe.dart';
import 'package:resep_in/pages/homepage.dart';
import 'package:resep_in/pages/recipes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int recipeCount = 0;
  List<dynamic> recipes = [];

  void initState() {
    super.initState();
    fetchRecipeCount();
    fetchRecipeData();
  }

  Future<void> fetchRecipeCount() async {
    final response = await http.get(Uri.parse('https://66d17ef762816af9a4f3d884.mockapi.io/recipes'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        recipeCount = data.length;
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<void> fetchRecipeData() async {
    final response = await http.get(Uri.parse('https://66d17ef762816af9a4f3d884.mockapi.io/recipes'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        recipes = data;
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/drawerheader_image_copy.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Text(
                  'ResepIN',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Color.fromARGB(255, 65, 179, 162),
                ),
              ),
              leading: Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 65, 179, 162),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text(
                  'Our Recipes',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            recipes.isEmpty
                ? Center(
                    child: Text(
                      "There's no recipes right now!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 179, 162),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 400,
                    child: ListView.builder(
                        itemCount: recipeCount,
                        itemBuilder: (context, index) {
                          if (index >= recipes.length) {
                            return Container(); // Avoid accessing out of bounds
                          }
                          final recipe = recipes[index];
                          return ListTile(
                            leading: Icon(
                              Icons.bookmark_border_outlined,
                              color: Color.fromARGB(255, 65, 179, 162),
                            ),
                            title: Text(
                              recipe['name_recipe'] ?? 'No name',
                              style: TextStyle(
                                color: Color.fromARGB(255, 65, 179, 162),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FocusRecipe(),
                                ),
                              );
                            },
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
