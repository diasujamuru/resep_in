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

  void initState() {
    super.initState();
    fetchRecipeCount();
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
              title: const Text(
                'Recipes',
                style: TextStyle(
                  color: Color.fromARGB(255, 65, 179, 162),
                ),  
              ),
              leading: Icon(
                Icons.book_outlined,
                color: Color.fromARGB(255, 65, 179, 162),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Recipes(),
                  ),
                );
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView.builder(
                  itemCount: recipeCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.bookmark_border_outlined),
                      title: const Text(
                        'Nasi Goreng',
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

        // body: ListView(
        //   padding: EdgeInsets.zero,
        //   children: [
        //     const DrawerHeader(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage('images/drawerheader_image_copy.jpg'),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       child: Center(
        //         child: Text(
        //           'ResepIN',
        //           style: TextStyle(
        //             fontSize: 30,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     ListTile(
        //       title: const Text(
        //         'Home',
        //         style: TextStyle(
        //           color: Color.fromARGB(255, 65, 179, 162),
        //         ),
        //       ),
        //       leading: Icon(
        //         Icons.home_outlined,
        //         color: Color.fromARGB(255, 65, 179, 162),
        //       ),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Homepage()),
        //         );
        //       },
        //     ),
        //     Theme(
        //       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        //       child: ExpansionTile(
        //         title: const Text(
        //           'Recipes',
        //           style: TextStyle(
        //             color: Color.fromARGB(255, 65, 179, 162),
        //           ),
        //         ),
        //         leading: Icon(
        //           Icons.book_outlined,
        //           color: Color.fromARGB(255, 65, 179, 162),
        //         ),
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 30),
        //             child: ListTile(
        //               title: const Text(
        //                 'All Recipes',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 65, 179, 162),
        //                 ),
        //               ),
        //               leading: Icon(
        //                 Icons.bookmark_outline,
        //                 color: Color.fromARGB(255, 65, 179, 162),
        //               ),
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (context) => Recipes()),
        //                 );
        //               },
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 30),
        //             child: ListTile(
        //               title: const Text(
        //                 'Nasi Goreng',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 65, 179, 162),
        //                 ),
        //               ),
        //               leading: Icon(
        //                 Icons.bookmark_outline,
        //                 color: Color.fromARGB(255, 65, 179, 162),
        //               ),
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => FocusRecipe(),
        //                   ),
        //                 );
        //               },
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),