import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;
  final double screenHeight;
  final double screenWidth;

  ProductImageSection({
    required this.imageUrl,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: screenHeight * 0.18,
          ),
        ),
        Positioned(
          top: screenHeight * 0.01,
          right: screenWidth * 0.02,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite_border,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
