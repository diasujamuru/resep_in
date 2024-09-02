import 'package:flutter/material.dart';
import 'package:resep_in/components/input_card.dart';

class InputRecipe extends StatelessWidget {
  const InputRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Make Your Own Recipe',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 65, 179, 162),
        ),
        backgroundColor: Color.fromARGB(255, 65, 179, 162),
        body: InputCard(),
      ),
    );

    // Center(
    //   child: Text(
    //     'This is Input Recipes Page',
    //   ),
    // );
  }
}
