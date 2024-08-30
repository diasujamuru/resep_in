import 'package:flutter/material.dart';
import 'package:resep_in/components/new_recipe_list.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'All Recipes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 65, 179, 162),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 65, 179, 162),
        body: ListViewCards(),
      ),
    );
  }
}
