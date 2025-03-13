import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class PhotoBookPage extends StatefulWidget {
  @override
  _PhotoBookPageState createState() => _PhotoBookPageState();
}

class _PhotoBookPageState extends State<PhotoBookPage> {
  final List<String> photoPaths = [
    'images/cancun1.jpg',
    'images/cancun2.jpg',
    'images/tulum1.jpg',
    'images/tulum2.jpg',
    'images/holbox1.jpg',
    'images/holbox2.jpg',
  ];

  final List<String> pageTitles = [
    'Vacaciones en Cancún',
    'Escapada a Tulum',
    'Aventura en Holbox',
  ];
  final List<String> pagesDates = [
    '7 ago 2024 - 10 ago 2024',
    '18 dic 2024 - 24 dic 2024',
    '2 feb 2025 - 5 feb 2025',
  ];

  final _controller = GlobalKey<PageFlipWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        children: List.generate(
          (photoPaths.length / 2).ceil(),
          (index) => _buildPhotoPages(page: index),
        ),
      ),
    );
  }

  Widget _buildPhotoPages({required int page}) {
    int photoIndex1 = page * 2;
    int photoIndex2 = photoIndex1 + 1;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pageTitles[page],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(pagesDates[page], textAlign: TextAlign.center),
              SizedBox(height: 20),
              if (photoIndex1 < photoPaths.length)
                _buildImage(photoPaths[photoIndex1]),
              SizedBox(height: 20),
              if (photoIndex2 < photoPaths.length)
                _buildImage(photoPaths[photoIndex2]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400, // Establece el ancho máximo deseado
        ),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
