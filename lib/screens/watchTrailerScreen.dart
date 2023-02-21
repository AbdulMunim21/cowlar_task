import 'package:cowlar_task/constants/colors.dart';
import 'package:cowlar_task/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerScreen extends StatefulWidget {
  const WatchTrailerScreen({super.key, required this.trailerId});
  final String trailerId;

  @override
  State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailerId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        hideThumbnail: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
        // hideControls: true,
        // controlsVisibleAtStart: true,
      ),
    )..addListener(listener);
  }

  listener() {
    if (PlayerState.ended == _controller.value.playerState) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ]);
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.center,
          child: FittedBox(
            child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  aspectRatio: 16 / 9,
                  showVideoProgressIndicator: true,
                  controller: _controller,
                ),
                builder: (context, player) {
                  return Stack(
                    children: [
                      player,
                      Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown
                            ]);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Done"),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
