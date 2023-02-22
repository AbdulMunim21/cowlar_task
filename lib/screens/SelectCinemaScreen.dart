import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SelectCinemaScreen extends StatefulWidget {
  final String title;
  final String releaseDate;
  const SelectCinemaScreen(
      {super.key, required this.title, required this.releaseDate});

  @override
  State<SelectCinemaScreen> createState() => _SelectCinemaScreenState();
}

class _SelectCinemaScreenState extends State<SelectCinemaScreen> {
  final dummyDates = [
    "5 March",
    "6 March",
    "7 March",
    "8 March",
    "9 March",
    "10 March",
    "11 March"
  ];

  final dummyCinemas = [
    {
      "id": 0,
      "time": "12:30",
      "name": "Cinetech + Hall 1",
      "startingRange": 50,
      "endingRange": 2500,
    },
    {
      "id": 1,
      "time": "12:30",
      "name": "Cinetech + Hall 1",
      "startingRange": 50,
      "endingRange": 2500,
    },
    {
      "id": 2,
      "time": "12:30",
      "name": "Cinetech + Hall 1",
      "startingRange": 50,
      "endingRange": 2500,
    },
    {
      "id": 3,
      "time": "12:30",
      "name": "Cinetech + Hall 1",
      "startingRange": 50,
      "endingRange": 2500,
    },
  ];
  int selectedIndex = 0;
  int selectedCinemaIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height(context) * 0.1),
          child: Container(
            color: appBarColor,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: width(context) * 0.1,
                  child: const FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: blackColor,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width(context) * 0.9,
                  height: height(context) * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(color: blackColor, fontSize: 30),
                      ),
                      Text(
                        "In Theaters ${DateFormat.yMMMd().format(DateTime.parse(widget.releaseDate))}",
                        style: const TextStyle(color: neonColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          width: width(context),
          height: height(context),
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.8,
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  alignment: Alignment.center,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.1,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: dummyDates
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex =
                                                  dummyDates.indexOf(e);
                                            });
                                          },
                                          child: Container(
                                            width: constraints.maxWidth * 0.3,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: selectedIndex ==
                                                      dummyDates.indexOf(e)
                                                  ? neonColor
                                                  : Colors.grey.shade100,
                                            ),
                                            child: Text(
                                              e.substring(0, 5),
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                color: blackColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.4,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: dummyCinemas
                                    .map((e) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          width: constraints.maxWidth * 0.8,
                                          height: constraints.maxHeight,
                                          child: LayoutBuilder(
                                              builder: (context, constraints) {
                                            final cinemaIndex =
                                                dummyCinemas.indexWhere(
                                              (element) =>
                                                  element['id'] ==
                                                  selectedCinemaIndex,
                                            );

                                            return Column(
                                              children: [
                                                SizedBox(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          dummyCinemas[
                                                                      cinemaIndex]
                                                                  ['time']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: blackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                            child: Text(dummyCinemas[
                                                                        cinemaIndex]
                                                                    ['name']
                                                                .toString())),
                                                      ],
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedCinemaIndex =
                                                          dummyCinemas.indexOf(
                                                              dummyCinemas[
                                                                  cinemaIndex]);
                                                    });
                                                  },
                                                  child: Container(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.7,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      border: Border.all(
                                                          color: cinemaIndex ==
                                                                  selectedCinemaIndex
                                                              ? neonColor
                                                              : backgroundColor),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.15,
                                                  child: Row(
                                                    children: [
                                                      const Text("From"),
                                                      Text(
                                                        "\$${dummyCinemas[cinemaIndex]['startingRange'].toString()}",
                                                        style: const TextStyle(
                                                            color: blackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text("or"),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "\$${dummyCinemas[cinemaIndex]['endingRange'].toString()}bonus",
                                                          style: const TextStyle(
                                                              color: blackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          }),
                                        ))
                                    .toList(),
                              );
                            }),
                          ),
                        ]);
                  }),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightBlueColor,
                    ),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.1,
                    alignment: Alignment.center,
                    child: const Text(
                      "Select Seats",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
