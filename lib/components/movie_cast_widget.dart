import 'package:flutter/material.dart';

class MovieCastWidget extends StatelessWidget {
  final List<String> cast;

  const MovieCastWidget({required this.cast, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: cast
          .map((actor) => Chip(
                label: Text(actor),
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
              ))
          .toList(),
    );
  }
}
