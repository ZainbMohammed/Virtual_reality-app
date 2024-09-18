import 'package:flutter/material.dart';
import 'package:virtual_reality/components/masked_image.dart';
import 'package:virtual_reality/components/search_filed_widget.dart';
import 'package:virtual_reality/constants.dart';
import 'package:virtual_reality/models/movie.dart';
import 'package:virtual_reality/screens/movie_details.dart';

class MoviesSection extends StatelessWidget {

  final String title;
  final List<Movie> movies;
  const MoviesSection({Key? key, required this.title, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    ListView(
      primary: true,
      children: [
         Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(
              color: Constants.kWhiteColor,
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: ((context, index) {
              String mask;
              if (index == 0) {
                mask = Constants.kMaskFirstIndex;
              } else if (index == newMovies.length - 1) {
                mask = Constants.kMaskLastIndex;
              } else {
                mask = Constants.kMaskCenter;
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  height: 160,
                  width: 142,
                  child: MaskedImage(
                    asset: newMovies[index].moviePoster,
                    mask: mask,
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 38,
        ),
       ],
    );
  }
}
