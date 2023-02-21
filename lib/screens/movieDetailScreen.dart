import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:cowlar_task/screens/watchTrailerScreen.dart';
import 'package:cowlar_task/widgets/genreBubbleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../blocs/internetBloc/internetBloc.dart';
import '../blocs/internetBloc/internetState.dart';
import '../providers/genreStateProvider.dart';

class MovieDetailScreen extends ConsumerWidget {
  final MovieModel movieData;
  const MovieDetailScreen({super.key, required this.movieData});

  @override
  Widget build(BuildContext context, ref) {
    final genreList = ref.read(genreStateProvider.notifier).genres;
    return OrientationBuilder(builder: (context, orientation) {
      final isPortrait = orientation == Orientation.portrait;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: width(context),
            height: height(context),
            child: isPortrait
                ? Column(children: [
                    ImageWidget(movieData: movieData, isPortrait: isPortrait),
                    MovieDetailWidget(
                        genreList: genreList,
                        movieData: movieData,
                        isPortrait: isPortrait),
                  ])
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageWidget(movieData: movieData, isPortrait: isPortrait),
                      MovieDetailWidget(
                          genreList: genreList,
                          movieData: movieData,
                          isPortrait: isPortrait),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    super.key,
    required this.genreList,
    required this.movieData,
    required this.isPortrait,
  });

  final List genreList;
  final MovieModel movieData;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: isPortrait ? 50 : 15),
          width: isPortrait ? constraints.maxWidth : constraints.maxWidth * 0.5,
          height: constraints.maxHeight,
          margin: EdgeInsets.only(top: isPortrait ? 10 : 30),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  // height: constraints.maxHeight * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Genres",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: genreList
                            .where((element) {
                              if (movieData.genreIds.contains(element['id'])) {
                                return true;
                              }
                              return false;
                            })
                            .toList()
                            .map(
                                (e) => GenreBubbleWidget(genreTitle: e['name']))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(color: darkGreyColor, thickness: 1),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            movieData.overview,
                            style: const TextStyle(
                              color: backgroundColor,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.movieData,
    required this.isPortrait,
  });

  final MovieModel movieData;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPortrait ? height(context) * 0.55 : height(context),
      width: isPortrait ? width(context) : width(context) * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://image.tmdb.org/t/p/w500/${movieData.imageUrl}"),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.2,
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: Colors.white,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 50,
                ),
                const Text(
                  "Watch",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                )
              ]),
            ),
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.8,
              // color: Colors.pink,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(isPortrait ? 20 : 5),
              margin: EdgeInsets.symmetric(horizontal: isPortrait ? 40 : 5),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "In Theaters ${DateFormat.yMMMd().format(DateTime.parse(movieData.releaseDate))}",
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      isPortrait
                          ? Column(
                              children: [
                                GetTicketsButton(
                                  isPortrait: isPortrait,
                                  constraints: constraints,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WatchTrailerButton(
                                    isPortrait: isPortrait,
                                    constraints: constraints,
                                    id: movieData.id)
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetTicketsButton(
                                  isPortrait: isPortrait,
                                  constraints: constraints,
                                ),
                                WatchTrailerButton(
                                    isPortrait: isPortrait,
                                    constraints: constraints,
                                    id: movieData.id)
                              ],
                            )
                    ]);
              }),
            )
          ],
        );
      }),
    );
  }
}

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton(
      {super.key,
      required this.isPortrait,
      required this.constraints,
      required this.id});

  final bool isPortrait;
  final BoxConstraints constraints;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (state is InternetAvailableState) {
              String trailerId = await MoviesAPI().getMovieTrailerId(id);
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WatchTrailerScreen(trailerId: trailerId),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet Not Availalbe")));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: blackColor.withOpacity(0.3),
              border: Border.all(
                color: lightBlueColor,
              ),
            ),
            padding: const EdgeInsets.all(20),
            width:
                isPortrait ? constraints.maxWidth : constraints.maxWidth * 0.48,
            height: isPortrait
                ? constraints.maxHeight * 0.2
                : constraints.maxHeight * 0.25,
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      "Watch Trailer",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}

class GetTicketsButton extends StatelessWidget {
  const GetTicketsButton(
      {super.key, required this.isPortrait, required this.constraints});

  final bool isPortrait;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightBlueColor,
      ),
      width: isPortrait ? constraints.maxWidth : constraints.maxWidth * 0.48,
      height: isPortrait
          ? constraints.maxHeight * 0.2
          : constraints.maxHeight * 0.25,
      alignment: Alignment.center,
      child: const Text(
        "Get Tickets",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
