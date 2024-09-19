import 'package:flutter/material.dart';

class MovieDetailsHeader extends StatelessWidget {
  final String title;
  final String rating;
  final String duration;

  const MovieDetailsHeader({
    required this.title,
    required this.rating,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 24),
                const SizedBox(width: 5),
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              duration,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
