import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff404c57),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff404c57),
              Constants.kBlackColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.6,
                width: screenWidth,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(movie.moviePoster),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svg/icon-back.svg',
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/svg/icon-menu.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 18,
              top: screenHeight * 0.92,
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFE53BB),
                      Color(0xFF09FBD3),
                    ],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreyColor,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Constants.kWhiteColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.66,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.5,
                transform:
                    Matrix4.translationValues(0, -screenHeight * 0.05, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        children: [
                          Text(
                            movie.movieName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Constants.kWhiteColor.withOpacity(0.85),
                            ),
                          ),
                          SizedBox(height: screenHeight <= 667 ? 10 : 20),
                          Text(
                            '${movie.movieReleaseYear} • ${movie.movieCategory} • ${movie.movieDuration}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Constants.kWhiteColor.withOpacity(0.75),
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: double.parse(movie.movieRating),
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Constants.kYellowColor,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                            unratedColor: Constants.kWhiteColor,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            movie.movieSinopsis,
                            textAlign: TextAlign.center,
                            maxLines: screenHeight <= 667 ? 2 : 4,
                            style: TextStyle(
                              fontSize: 14,
                              color: Constants.kWhiteColor.withOpacity(0.75),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
