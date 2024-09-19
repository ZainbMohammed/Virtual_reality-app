import 'package:flutter/material.dart';
import 'package:virtual_reality/components/masked_image.dart';
import 'package:virtual_reality/constants.dart';
import 'package:virtual_reality/models/movie.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final Function(Movie) onMovieTap;

   MovieSection({
    Key? key,
    required this.title,
    required this.movies,
    required this.onMovieTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Constants.kWhiteColor,
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              String mask;
              if (index == 0) {
                mask = Constants.kMaskFirstIndex;
              } else if (index == movies.length - 1) {
                mask = Constants.kMaskLastIndex;
              } else {
                mask = Constants.kMaskCenter;
              }

              return GestureDetector(
                              
                onTap: () {
                   print('Tapped movie: ${movie.movieName}');
                    onMovieTap(movie);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 160,
                  width: 142,
                  child: MaskedImage(
                    asset: movies[index].moviePoster,
                    mask: mask,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
