import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String imagePath;
  final String releaseYear;

  const MoviePoster({required this.imagePath, required this.releaseYear, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            releaseYear,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
