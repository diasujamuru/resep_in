import 'package:flutter/material.dart';
import 'package:resep_in/pages/focus_recipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListViewCards extends StatefulWidget {
  @override
  State<ListViewCards> createState() => _ListViewCardsState();
}

class _ListViewCardsState extends State<ListViewCards> {
  List<dynamic> recipes = [];
  int recipeCount = 0;
  bool isLoading = true;

  void initState() {
    super.initState();
    fetchRecipeCount();
    fetchRecipeName();
  }

  Future<void> fetchRecipeCount() async {
    final response = await http.get(Uri.parse('https://66d17ef762816af9a4f3d884.mockapi.io/recipes'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        recipeCount = data.length;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<void> fetchRecipeName() async {
    try {
      final response = await http.get(Uri.parse('https://66d17ef762816af9a4f3d884.mockapi.io/recipes'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          recipes = data;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ))
        : Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: recipeCount,
              itemBuilder: (context, index) {
                if (index >= recipes.length) {
                  return Container(); // Avoid accessing out of bounds
                }
                final recipe = recipes[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(image: AssetImage('images/nasi_goreng.webp')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            recipe['name_recipe'] ?? 'No name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 65, 179, 162),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            recipe['type'] ?? 'No Type',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 30, 82, 74),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => FocusRecipe(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'See',
                              style: TextStyle(
                                color: Color.fromARGB(255, 65, 179, 162),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
