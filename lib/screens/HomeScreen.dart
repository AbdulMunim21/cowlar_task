import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:cowlar_task/database/moviesApi.dart';
import 'package:cowlar_task/model/movieModel.dart';
import 'package:cowlar_task/providers/genreStateProvider.dart';
import 'package:cowlar_task/screens/movieDetailScreen.dart';
import 'package:cowlar_task/widgets/appBarWidgets/appBarWidget.dart';
import 'package:cowlar_task/widgets/navBarWidgets/navBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isSearching = false;
  void changeSearchingFunction() {
    controller.clear();
    setState(() {
      isSearching = !isSearching;
    });
  }

  TextEditingController controller = TextEditingController();

  var searchedMoviesList = [];
  var genreList = [];

  void onSubmit(String text) async {
    searchedMoviesList = await MoviesAPI().getSearchMovie(text);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    genreList = ref.read(genreStateProvider.notifier).genres;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isPortrait = orientation == Orientation.portrait;
      return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
            preferredSize: isPortrait
                ? Size.fromHeight(height(context) * 0.1)
                : Size.fromHeight(height(context) * 0.24),
            child: AppBarWidget(
              isSearching: isSearching,
              changeSearchingFunction: changeSearchingFunction,
              controller: controller,
              onSubmit: onSubmit,
            ),
          ),
          body: SizedBox(
            width: width(context),
            height: height(context) * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height(context) * 0.9,
                    child: isSearching
                        ? Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.text != "")
                                      const Text(
                                        "Top Results",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: darkGreyColor),
                                      ),
                                    if (controller.text != "")
                                      const Divider(
                                        color: darkGreyColor,
                                        thickness: 2,
                                      ),
                                    if (controller.text != "")
                                      SizedBox(
                                        height: isPortrait
                                            ? constraints.maxHeight * 0.93
                                            : constraints.maxHeight * 0.6,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) =>
                                              SearchedMovieTile(
                                                  searchedMoviesList:
                                                      searchedMoviesList,
                                                  isPortrait: isPortrait,
                                                  genreList: genreList,
                                                  constraints: constraints,
                                                  index: index),
                                          itemCount: searchedMoviesList.length,
                                        ),
                                      )
                                  ]);
                            }),
                          )
                        : LayoutBuilder(builder: (context, constraints) {
                            return FutureBuilder(
                              future: MoviesAPI().getAllMovies(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: Text("Loading"),
                                  );
                                }
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    final movieData = (snapshot.data
                                        as List<MovieModel>)[index];
                                    return MovieTileWidget(
                                      movieData: movieData,
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight,
                                      isPortrait: isPortrait,
                                    );
                                  },
                                  itemCount: (snapshot.data as List<MovieModel>)
                                      .length,
                                );
                              },
                            );
                          }),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: NavBarWidget(isPortrait: isPortrait),
        ),
      );
    });
  }
}

class SearchedMovieTile extends StatelessWidget {
  const SearchedMovieTile(
      {super.key,
      required this.searchedMoviesList,
      required this.isPortrait,
      required this.genreList,
      required this.index,
      required this.constraints});

  final List searchedMoviesList;
  final bool isPortrait;
  final List genreList;
  final int index;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return MovieDetailScreen(movieData: searchedMoviesList[index]);
          },
        ));
      },
      child: Container(
        height: isPortrait
            ? constraints.maxHeight * 0.2
            : constraints.maxHeight * 0.5,
        width: constraints.maxWidth,
        margin: const EdgeInsets.only(top: 15),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${searchedMoviesList[index].imageUrl}"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        searchedMoviesList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: darkGreyColor,
                          fontSize: isPortrait ? 18 : 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(genreList
                              .where((element) {
                                if (searchedMoviesList[index]
                                    .genreIds
                                    .contains(element['id'])) {
                                  return true;
                                }
                                return false;
                              })
                              .toList()
                              .isEmpty
                          ? ""
                          : genreList.where((element) {
                              if (searchedMoviesList[index]
                                  .genreIds
                                  .contains(element['id'])) {
                                return true;
                              }
                              return false;
                            }).toList()[0]['name'])
                    ],
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight,
                alignment: Alignment.center,
                child: const FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: neonColor,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class MovieTileWidget extends StatelessWidget {
  const MovieTileWidget(
      {super.key,
      required this.movieData,
      required this.width,
      required this.height,
      required this.isPortrait});

  final MovieModel movieData;
  final double width;
  final double height;
  final bool isPortrait;

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
        height: isPortrait ? height * 0.35 : height * 0.8,
        width: isPortrait ? width : width * 0.2,
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
