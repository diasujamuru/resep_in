import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resep_in/pages/homepage.dart';

class InputCard extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController name_recipe = TextEditingController();
  // TextEditingController type = TextEditingController();
  TextEditingController rating = TextEditingController();

  Future _simpan() async {
    final response = await http.post(Uri.parse("https://66d17ef762816af9a4f3d884.mockapi.io/recipes"), body: {
      'name_recipe': name_recipe.text,
      // 'type': type.text,
      // 'rating': rating.text
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Input Recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: name_recipe,
                      decoration: InputDecoration(
                        labelText: 'Name Recipe',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Nama harus diisi";
                        }
                      }),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // DropdownButtonFormField<String>(
                  //     items: [
                  //       'Makanan',
                  //       'Minuman'
                  //     ].map((String value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value),
                  //       );
                  //     }).toList(),
                  //     onChanged: (String? newValue) {},
                  //     decoration: InputDecoration(
                  //       labelText: 'Type',
                  //       border: OutlineInputBorder(),
                  //     ),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Tipe harus diisi";
                  //       }
                  //     }),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //     decoration: InputDecoration(
                  //       labelText: 'Rating',
                  //       border: OutlineInputBorder(),
                  //     ),
                  //     keyboardType: TextInputType.number,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Rating harus diisi";
                  //       }
                  //     }),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _simpan();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                              (route) => false);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 65, 179, 162),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
