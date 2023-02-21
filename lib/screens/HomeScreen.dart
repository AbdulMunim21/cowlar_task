import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:cowlar_task/screens/movieDetailScreen.dart';
import 'package:cowlar_task/widgets/appBarWidgets/appBarWidget.dart';
import 'package:cowlar_task/widgets/navBarWidgets/navBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: width(context),
          height: height(context) * 0.9,
          child: Column(
            children: [
              const AppBarWidget(),
              SizedBox(
                height: height(context) * 0.75,
                child: LayoutBuilder(builder: (context, constraints) {
                  return FutureBuilder(
                    future: MoviesAPI().getAllMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Text("Loading"),
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final movieData =
                              (snapshot.data as List<dynamic>)[index];
                          return MovieTileWidget(
                            movieData: movieData,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          );
                        },
                        itemCount: (snapshot.data as List<dynamic>).length,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavBarWidget(),
      ),
    );
  }
}

class MovieTileWidget extends StatelessWidget {
  const MovieTileWidget({
    super.key,
    required this.movieData,
    required this.width,
    required this.height,
  });

  final MovieModel movieData;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MovieDetailScreen(movieData: movieData),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        height: height * 0.35,
        width: width,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/${movieData.imageUrl}"),
          ),
        ),
        child: Text(
          movieData.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
