import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:getwidget/getwidget.dart';
import 'package:radioapp/views/channel_screen.dart';
import 'package:radioapp/views/splash_screen.dart';
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
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  color: Colors.teal.shade700,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/f1.png',
                title: 'FM RADIO',
                subtitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
            buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/f2.jpeg',
                title: 'FM RECYCLE',
                subtitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/f3.jpeg',
                title: 'FM AUDIO',
                subtitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: Size.fromHeight(80)),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ChannelScreen()));
              },
              child: Text('Get Started', style: TextStyle(fontSize: 24)))
          : Container(
              padding: EdgeInsets.symmetric(),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text('Skip')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          activeDotColor: Colors.teal.shade700,
                          spacing: 16,
                          dotColor: Colors.black26),
                      onDotClicked: ((index) => controller.animateToPage(index,
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
                      child: Text('Next'))
                ],
              ),
            ),
    );
    // SafeArea(
    //   child: GFIntroScreen(
    //     color: Colors.blueGrey,
    //     slides: slides(),
    //     pageController: _pageController,
    //     currentIndex: 1,
    //     pageCount: 2,
    //     introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
    //       pageController: _pageController,
    //       pageCount: slideList.length,
    //       currentIndex: initialPage,
    //       onForwardButtonTap: () {
    //         _pageController.nextPage(
    //             duration: const Duration(milliseconds: 500),
    //             curve: Curves.linear);
    //       },
    //       onBackButtonTap: () {
    //         _pageController.previousPage(
    //             duration: const Duration(milliseconds: 500),
    //             curve: Curves.linear);
    //       },
    //       navigationBarColor: Colors.white,
    //       showDivider: false,
    //       // inActiveColor: Colors.grey[200],
    //       activeColor: GFColors.SUCCESS,
    //     ),
    //   ),
    // );
  }

  // List<Widget> slides() {
  //   slideList = [
  //     Container(
  //       child: GFImageOverlay(
  //         width: MediaQuery.of(context).size.width,
  //         padding: EdgeInsets.all(16),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.only(top: 70.0, left: 20),
  //               child: Text(
  //                 'Welcome!',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     decoration: TextDecoration.none,
  //                     fontSize: 25),
  //               ),
  //             ),
  //           ],
  //         ),
  //         color: Colors.orange,
  //         image: AssetImage('assets/f1.jpeg'),
  //         boxFit: BoxFit.cover,
  //         colorFilter:
  //             ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //     ),
  //     Column(
  //       children: [
  //         Expanded(
  //             flex: 6,
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(0),
  //                   image: DecorationImage(
  //                     image: const AssetImage('assets/f2.jpeg'),
  //                     fit: BoxFit.cover,
  //                     colorFilter: ColorFilter.mode(
  //                         Colors.black.withOpacity(0.2), BlendMode.darken),
  //                   )),
  //             )),
  //         Expanded(flex: 4, child: Text("kamal shamala merer panjee"))
  //       ],
  //     ),
  //     Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(0),
  //           image: DecorationImage(
  //             image: AssetImage('assets/f3.jpeg'),
  //             fit: BoxFit.fitHeight,
  //             colorFilter: ColorFilter.mode(
  //                 Colors.black.withOpacity(0.2), BlendMode.darken),
  //           )),
  //     ),
  //   ];
  //   return slideList;
  // }
}
