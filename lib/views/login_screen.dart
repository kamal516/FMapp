import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:radioapp/const/color.dart';
import 'package:radioapp/views/bar.dart';

import 'package:radioapp/views/constant.dart';

import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
          ),
        ),
        num != 1
            ? Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Music\nStation',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    controller: emailController,
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.email_outlined),
                                        color: Colors.grey,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Divider(),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  controller: passwordController,
                                  textInputAction: TextInputAction.search,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.lock),
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SIGN IN",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            FlatButton(
                                              padding: EdgeInsets.only(
                                                  right: 20, bottom: 10),
                                              child: Text(
                                                "Forgot password?",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        RawMaterialButton(
                                          onPressed: () {
                                            Get.to(Example());
                                          },
                                          elevation: 2.0,
                                          fillColor: Colors.white,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            size: 30.0,
                                          ),
                                          padding: EdgeInsets.all(15.0),
                                          shape: CircleBorder(),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  """Don't have an account?""",
                                  style: TextStyle(color: Colors.white),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        num = 1;
                                      });
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 30.0, right: 10.0),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 36,
                                      )),
                                ),
                                Text("Social Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontFamily: "Poppins-Medium")),
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 30.0),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 36,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFF102397),
                                          Color(0xFF187adf),
                                          Color(0xFF00eaf8),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: Icon(Icons.facebook,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFff4f38),
                                          Color(0xFFff355d),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: FaIcon(FontAwesomeIcons.google,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFF17ead9),
                                          Color(0xFF6078ea),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: FaIcon(FontAwesomeIcons.twitter,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Music\nStation',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    controller: emailController,
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.person),
                                        color: Colors.grey,
                                      ),
                                      hintText: 'Name',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Divider(),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  controller: passwordController,
                                  textInputAction: TextInputAction.search,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.email_outlined),
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  controller: passwordController,
                                  textInputAction: TextInputAction.search,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.lock),
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SIGN UP",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        RawMaterialButton(
                                          onPressed: () {
                                            Get.to(Example());
                                          },
                                          elevation: 2.0,
                                          fillColor: Colors.white,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            size: 30.0,
                                          ),
                                          padding: EdgeInsets.all(15.0),
                                          shape: CircleBorder(),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  """Already have an account?""",
                                  style: TextStyle(color: Colors.white),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        num = 0;
                                      });
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 30.0, right: 10.0),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 36,
                                      )),
                                ),
                                Text("Social Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontFamily: "Poppins-Medium")),
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 30.0),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 36,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFF102397),
                                          Color(0xFF187adf),
                                          Color(0xFF00eaf8),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: Icon(Icons.facebook,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFff4f38),
                                          Color(0xFFff355d),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: FaIcon(FontAwesomeIcons.google,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xFF17ead9),
                                          Color(0xFF6078ea),
                                        ], tileMode: TileMode.clamp)),
                                    child: RawMaterialButton(
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: FaIcon(FontAwesomeIcons.twitter,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
