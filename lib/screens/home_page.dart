import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:virtual_reality/components/masked_image.dart';
import 'package:virtual_reality/constants.dart';
import 'package:virtual_reality/models/movie.dart';
import 'package:virtual_reality/screens/movie_details.dart';
import 'package:virtual_reality/components/movies_section.dart';

import '../components/search_filed_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

 void _onMovieTap(BuildContext context, Movie selectedMovie) {
  print('Tapped movie: ${selectedMovie.movieName}');
  try {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movie: selectedMovie),
      ),
    ).then((value) {
      print('Navigated to MovieDetailPage');
    });
  } catch (e) {
    print('Navigation error: $e');  // Print any navigation errors
  }
}




  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie sections
                  MovieSection(
                      title: 'Polys movies',
                      movies: polysMovies,
                      onMovieTap: (movie) => _onMovieTap(context, movie)),
                  MovieSection(
                      title: 'Action movies',
                      movies: actionMovies,
                      onMovieTap: (movie) => _onMovieTap(context, movie)),
                  MovieSection(
                      title: 'More movies',
                      movies: actionMovies2,
                      onMovieTap: (movie) => _onMovieTap(context, movie)),
                  MovieSection(
                      title: 'Popular movies',
                      movies: newMovies,
                      onMovieTap: (movie) => _onMovieTap(context, movie)),
                  MovieSection(
                      title: 'Upcoming movies',
                      movies: upcomingMovies,
                      onMovieTap: (movie) => _onMovieTap(context, movie)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
          width: screenWidth,
          height: 92,
          borderRadius: 0,
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kWhiteColor.withOpacity(0.1),
              Constants.kWhiteColor.withOpacity(0.1),
            ],
          ),
          border: 0,
          blur: 30,
          borderGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ],
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            notchMargin: 4,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconHome,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconPlayOnTv,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(''),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconCategories,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconDownload,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
