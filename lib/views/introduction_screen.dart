import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:getwidget/getwidget.dart';
import 'package:radioapp/views/channel_screen.dart';
import 'package:radioapp/views/splash_screen.dart';
import 'package:radioapp/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // late PageController _pageController;
  // late List<Widget> slideList;
  // late int initialPage;
  final controller = PageController();
  bool isLastPage = false;

  double pw = Get.size.width;
  double ph = Get.size.height;
  @override
  void initState() {
    // _pageController = PageController(initialPage: 2);
    // initialPage = _pageController.initialPage;
    super.initState();
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
              padding: EdgeInsets.only(left: 25, top: pw * (0.6)),
              alignment: Alignment.topLeft,
              child: Text(
                title,
                //  'LETS BE PRODUCTIVE TODAY',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    // color: Color.fromRGBO(255, 255, 255, 1)
                    ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 25, right: 20),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ))
          ],
        ),
      ]);
  // Container(
  //   color: color,
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.asset(
  //         urlImage,
  //         fit: BoxFit.cover,
  //         width: double.infinity,
  //       ),
  //       SizedBox(height: 20),
  //       Text(
  //         title,
  //         style: TextStyle(
  //             color: Colors.teal.shade700,
  //             fontSize: 32,
  //             fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 20),
  //       Container(
  //         padding: EdgeInsets.symmetric(),
  //         child: Text(
  //           subtitle,
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       )
  //     ],
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 50),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                buildPage(
                    color: Colors.green.shade100,
                    urlImage: 'assets/a1.jpg',
                    title: 'FM RADIO',
                    subtitle:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                buildPage(
                    color: Colors.blue.shade100,
                    urlImage: 'assets/a4.jpg',
                    title: 'FM RECYCLE',
                    subtitle:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                buildPage(
                    color: Colors.green.shade100,
                    urlImage: 'assets/A6.jpg',
                    title: """It's Time To Show""",
                    subtitle:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLastPage
                    ? Container(
                        decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //   begin: Alignment.topRight,
                            //   end: Alignment.bottomLeft,
                            //   stops: [
                            //     0.4,
                            //     0.9,
                            //   ],
                            //   colors: [
                            //     Colors.red,
                            //     Colors.indigo,
                            //   ],
                            // )
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Center(
                            child: RaisedButton(
                              padding: EdgeInsets.all(18),
                              textColor: Colors.white,
                              color: Color(0xff595353),
                              child: Text("Get Started",
                                  style: TextStyle(fontSize: 24)),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('showHome', true);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              // TextButton(
                              //     style: TextButton.styleFrom(
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(0),
                              //         ),
                              //         primary: Colors.white,
                              //         // backgroundColor: Colors.red,
                              //         minimumSize: Size.fromHeight(60)),
                              //     onPressed: () async {
                              //       final prefs =
                              //           await SharedPreferences.getInstance();
                              //       prefs.setBool('showHome', true);
                              //       Navigator.of(context).pushReplacement(
                              //           MaterialPageRoute(
                              //               builder: (context) => ChannelScreen()));
                              //     },
                              //     child: Text('Get Started',
                              //         style: TextStyle(fontSize: 24))),
                            ),
                          ),
                        ))
                    : Container(
                        // color: Colors.transparent,
                        padding: EdgeInsets.symmetric(),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.jumpToPage(2);
                                },
                                child: Text(
                                  'SKIP',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                            Center(
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: WormEffect(
                                    activeDotColor: Colors.pink,
                                    spacing: 12,
                                    dotColor: Colors.white),
                                onDotClicked: ((index) =>
                                    controller.animateToPage(index,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn)),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))
                          ],
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
