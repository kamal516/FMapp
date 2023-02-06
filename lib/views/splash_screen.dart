import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:radioapp/views/channel_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    dat();
  }

  dat() {
    Timer(Duration(seconds: 3), () {
      Get.to(ChannelScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.orangeAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 180,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            //  radius: 5,
                            child: ClipOval(
                              child: Image.asset("assets/f1.png"),
                              //  Image.network(
                              //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmnvg38VWm9qcq_PyXi2upClk8h1vZylV8jQ&usqp=CAU",
                              // ),
                            ),
                          )
                          // Image.asset("assest/vakeel.png"),
                          ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Video call",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Version-1.0",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
