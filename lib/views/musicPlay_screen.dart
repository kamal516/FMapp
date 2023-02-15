import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayScreen> createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen>
    with SingleTickerProviderStateMixin {
  double pw = Get.size.width;
  double ph = Get.size.height;

  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration = Duration(seconds: 0);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2));
  // ..repeat();

  void initPlayer() async {
    await player.setSource(
        //UrlSource(url)
        AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  //init the player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                // colorFilter: new ColorFilter.mode(
                //     Colors.black.withOpacity(0.1), BlendMode.dstATop),
                image: AssetImage(urlImage),
                fit: BoxFit.fitHeight),
          ),
        ),
        Container(
          color: Colors.black26,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: pw * (0.4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 125,
                    backgroundColor: Colors.white,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 2 * math.pi,
                          child: child,
                        );
                      },
                      child: CircleAvatar(
                        radius: 115,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083390_1280.jpg'),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        //  'LETS BE PRODUCTIVE TODAY',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            // color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 50),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/a1.jpg',
                title: 'Diljit Dosanjh',
                subtitle:
                    'Singing is the act of creating musical sounds with the voice.'),
            Padding(
              padding: EdgeInsets.only(top: ph * (0.040)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      iconSize: 30,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: ph * (0.72)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(value / 60).floor()}: ${(value % 60).floor()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: pw * (0.7),
                        child: Slider.adaptive(
                          inactiveColor: Colors.white,
                          onChangeEnd: (new_value) async {
                            setState(() {
                              value = new_value;
                              print(new_value);
                            });
                            await player
                                .seek(Duration(seconds: new_value.toInt()));
                          },
                          min: 0.0,
                          value: value,
                          max: duration!.inSeconds.toDouble(),
                          onChanged: (value) {},
                          activeColor: Colors.red,
                        ),
                      ),
                      Text(
                        "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.black87,
                          border: Border.all(color: Colors.white38),
                        ),
                        width: 50.0,
                        height: 50.0,
                        child: InkWell(
                          onTapDown: (details) {
                            player.setPlaybackRate(0.5);
                          },
                          onTapUp: (details) {
                            player.setPlaybackRate(1);
                          },
                          child: Center(
                            child: Icon(
                              Icons.fast_rewind_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.red[400],
                          border: Border.all(color: Colors.pink),
                        ),
                        width: 60.0,
                        height: 60.0,
                        child: InkWell(
                          onTap: () async {
                            //setting the play function
                            if (isPlaying) {
                              await player.pause();
                              _controller.stop();
                              setState(() {
                                isPlaying = false;
                              });
                            } else {
                              await player.resume();
                              _controller.repeat();
                              setState(() {
                                isPlaying = true;
                              });
                            }

                            player.onPositionChanged.listen(
                              (position) {
                                setState(() {
                                  value = position.inSeconds.toDouble();

                                  print(value);
                                });
                              },
                            );

                            print(duration);
                          },
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.black87,
                          border: Border.all(color: Colors.white38),
                        ),
                        width: 50.0,
                        height: 50.0,
                        child: InkWell(
                          onTapDown: (details) {
                            player.setPlaybackRate(2);
                          },
                          onTapUp: (details) {
                            player.setPlaybackRate(1);
                          },
                          child: Center(
                            child: Icon(
                              Icons.fast_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //setting the player controller
          ],
        ),
      ),
    );
  }
}
