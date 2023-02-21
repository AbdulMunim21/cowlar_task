import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/internetBloc/internetBloc.dart';
import '../../blocs/internetBloc/internetState.dart';

class SearchFieldWidget extends StatelessWidget {
  final Function func;
  final TextEditingController controller;
  final Function onSubmit;
  SearchFieldWidget(
      {super.key,
      required this.func,
      required this.controller,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            return Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: darkGreyColor,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    cursorColor: blackColor,
                    onFieldSubmitted: (value) {
                      if (state == InternetAvailableState) {
                        onSubmit(value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: purpleColor,
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                            content: const Text('Internet Not Available'),
                          ),
                        );
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "TV shows, movies and more",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => func(),
                  child: const FaIcon(
                    FontAwesomeIcons.circleXmark,
                    color: darkGreyColor,
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
