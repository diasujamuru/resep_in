import 'package:flutter/material.dart';

class FocusRecipe extends StatelessWidget {
  const FocusRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Nasi Goreng',
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
          body: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ImageSection(
                    image: 'images/nasi_goreng.webp',
                  ),
                ),
                TitleSection(
                  name: 'Nasi Goreng',
                  category: 'Makanan',
                  rating: '5.0',
                ),
                ButtonSection(),
                TextSection(
                    description: '     Nasi goreng adalah hidangan khas Indonesia yang terbuat dari '
                        'nasi yang digoreng dengan bumbu seperti bawang merah, '
                        'bawang putih, kecap manis, dan cabai. Hidangan ini sering '
                        'ditambah dengan bahan-bahan seperti telur, ayam, atau udang. '
                        'Nasi goreng dikenal dengan rasa gurih dan sedikit manis, serta '
                        'aromanya yang khas. Sering disajikan dengan pelengkap seperti '
                        'kerupuk, acar, atau irisan mentimun, nasi goreng menjadi pilihan '
                        'populer untuk sarapan, makan siang, atau makan malam. Sifatnya '
                        'yang fleksibel dan mudah disesuaikan membuat nasi goreng digemari '
                        'banyak orang dan mudah ditemukan di berbagai warung hingga restoran.'),
              ],
            ),
          )),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.category,
    required this.rating,
  });

  final String name;
  final String category;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.white,
          ),
          Text(
            rating,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.white;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(color: color, icon: Icons.book_outlined, label: 'DETAIL'),
        ButtonWithText(color: color, icon: Icons.share_outlined, label: 'SHARE'),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        image,
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}
