import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: AnotherCarousel(
            images: const [
              AssetImage('images/nasi_goreng.webp'),
              AssetImage('images/food_images_1.jpg'),
              AssetImage('images/food_images_2.png'),
            ],
            dotSize: 3,
            indicatorBgPadding: 7.0,
          ),
        ),
      ),
    );
  }
}
