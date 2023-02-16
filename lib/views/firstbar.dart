import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:radioapp/controllers/channel_controller.dart';
import 'package:radioapp/views/introduction_screen.dart';
import 'package:radioapp/views/musicPlay_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final channelControler = Get.put(ChannelControler());
  var datat;

  double pw = Get.size.width;
  double ph = Get.size.height;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // assetImage = AssetImage('assets/yourimage.png');
    // precacheImage(assetImage, context);
  }

  sideNav() {
    return Drawer(
        child: Stack(children: <Widget>[
      //first child be the blur background
      BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0), //this is dependent on the import statment above
          child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)))),
      ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 48,
                  child: CircleAvatar(
                      radius: 45,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/a1.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ))),
              Text("Himmat Sandhu", style: TextStyle(color: Colors.white)),
              Text("hm@1313gmail.com", style: TextStyle(color: Colors.white)),
            ],
          ),
        )
            // Text('Hello Drawer Title')
            ),
        ListTile(
            leading: Icon(Icons.dashboard, color: Colors.white),
            title: Text("Dashboard", style: TextStyle(color: Colors.white)),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text("Profile", style: TextStyle(color: Colors.white)),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text("Home", style: TextStyle(color: Colors.white)),
            onTap: () {}),
        Divider(color: Colors.white),
        ListTile(
            leading: Icon(Icons.lock, color: Colors.white),
            title:
                Text("Privacy Policy", style: TextStyle(color: Colors.white)),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.phone, color: Colors.white),
            title: Text("Contact us", style: TextStyle(color: Colors.white)),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text("Sign out", style: TextStyle(color: Colors.white)),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => IntroductionScreen()));
            }),
      ])
    ]));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: pw * (0.7),
        child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: sideNav()),
      ),
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ).createShader(bounds),
            blendMode: BlendMode.darken,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/a1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ph * (0.06)),
                    child: Row(
                      children: [
                        IconButton(
                            iconSize: 30,
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Himmat Sandhu',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ph * (0.06), bottom: 10, right: 10),
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 27,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/a1.jpg'
                                        // channelControler
                                        //   .channelData[3]
                                        //   .channelList[3]
                                        //   .imageUrl
                                        ),
                                    fit: BoxFit.cover,
                                  )),
                            ))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children: [
                    Text(
                      'New Album',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.5,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: imgList
                    .map((item) => Container(
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage('assets/a2.jpg'),
                                //NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                        ))
                    .toList(),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < imgList.length; i++)
                    Container(
                      height: 13,
                      width: 13,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: currentIndex == i ? Colors.blue : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(2, 2))
                          ]),
                    )
                ],
              ),
              Divider(),
              Expanded(
                  flex: 1,
                  child: GetBuilder<ChannelControler>(
                    builder: ((controller) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: channelControler.channelData.length,
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    datat = channelControler.channelData[index];
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 35,
                                            child: CircleAvatar(
                                                backgroundColor: Colors.grey,
                                                radius: 33,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          channelControler
                                                              .channelData[
                                                                  index]
                                                              .channelImage,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ))),
                                        Text(
                                          channelControler
                                              .channelData[index].channelType,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    }),
                  )),
              Expanded(
                  flex: 2,
                  child: GetBuilder<ChannelControler>(
                    builder: ((controller) {
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemCount: datat == null
                              ? 6
                              //  channelControler
                              //     .channelData[0].channelList.length
                              : datat.channelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color:
                                  //Color(0xff595353),
                                  Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(2),
                              elevation: 10,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    contentPadding: EdgeInsets.all(1),
                                    title: Text(
                                        datat == null
                                            ? 'Hip-Hop'
                                            // channelControler.channelData[0]
                                            //     .channelList[0].name
                                            : datat.channelList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    subtitle: Text(
                                      'hm@1313gmail.com',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    leading: CircleAvatar(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(datat == null
                                                ? 'assets/a1.jpg'
                                                // channelControler
                                                //     .channelData[0]
                                                //     .channelList[0]
                                                //     .imageUrl
                                                : datat.channelList[index]
                                                    .imageUrl),
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                    trailing: Wrap(
                                      spacing: 10, // space between two icons
                                      children: <Widget>[
                                        IconButton(
                                            iconSize: 30,
                                            onPressed: () {
                                              Get.to(MusicPlayScreen());
                                            },
                                            icon: Icon(
                                              Icons.play_arrow_outlined,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              // final prefs =
                                              //     await SharedPreferences
                                              //         .getInstance();
                                              // prefs.setBool('showHome', false);
                                              // Navigator.of(context).pushReplacement(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             IntroductionScreen()));
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                            ))
                                        // CircleAvatar(
                                        //     backgroundColor: Colors.grey,
                                        //     child: IconButton(
                                        //         onPressed: () {
                                        //           Get.to(MusicPlayScreen());
                                        //         },
                                        //         icon: Icon(
                                        //           Icons.play_arrow_outlined,
                                        //           color: Colors.white,
                                        //         ))),
                                        // CircleAvatar(
                                        //     backgroundColor: Colors.grey,
                                        //     child: IconButton(
                                        //         onPressed: () async {
                                        //           final prefs =
                                        //               await SharedPreferences
                                        //                   .getInstance();
                                        //           prefs.setBool(
                                        //               'showHome', false);

                                        //           Navigator.of(context)
                                        //               .pushReplacement(
                                        //                   MaterialPageRoute(
                                        //                       builder: (context) =>
                                        //                           IntroductionScreen()));
                                        //         },
                                        //         icon: Icon(
                                        //           Icons.favorite,
                                        //           color: Colors.white,
                                        //         ))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            // Text(datat == null
                            //     ? channelControler.channelData[0].channelList[0].name
                            //     : datat.channelList[index].name);
                            //channelByCategoryList(datat.channelList);
                          });
                    }),
                  ))
            ],
          )
        ],
      ),
    );
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
}
