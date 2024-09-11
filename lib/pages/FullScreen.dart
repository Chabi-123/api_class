import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Full Screen',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Center(
          child: Hero(
            tag: 'fullscreen-image',
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
