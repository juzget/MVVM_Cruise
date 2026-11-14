import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;

  const HeaderImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: double.infinity,
      height: 220,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 220,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.image, size: 50, color: Colors.grey),
          ),
        );
      },
    );
  }
}