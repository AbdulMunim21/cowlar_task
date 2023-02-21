import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:cowlar_task/widgets/genreBubbleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../providers/genreStateProvider.dart';

class MovieDetailScreen extends ConsumerWidget {
  final MovieModel movieData;
  const MovieDetailScreen({super.key, required this.movieData});

  @override
  Widget build(BuildContext context, ref) {
    final genreList = ref.read(genreStateProvider.notifier).genres;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: width(context),
          height: height(context),
          child: Column(children: [
            Container(
              height: height(context) * 0.55,
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
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
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
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: lightBlueColor,
                                ),
                                width: constraints.maxWidth,
                                height: constraints.maxHeight * 0.2,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Get Tickets",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: blackColor.withOpacity(0.3),
                                  border: Border.all(
                                    color: lightBlueColor,
                                  ),
                                ),
                                padding: const EdgeInsets.all(20),
                                width: constraints.maxWidth,
                                height: constraints.maxHeight * 0.2,
                                alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.play,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Watch Trailer",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ]),
                              )
                            ]);
                      }),
                    )
                  ],
                );
              }),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  margin: const EdgeInsets.only(top: 10),
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
                                      if (movieData.genreIds
                                          .contains(element['id'])) {
                                        return true;
                                      }
                                      return false;
                                    })
                                    .toList()
                                    .map((e) => GenreBubbleWidget(
                                        genreTitle: e['name']))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
