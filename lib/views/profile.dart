import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  double pw = Get.size.width;
  double ph = Get.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //         // colorFilter: new ColorFilter.mode(
                //         //     Colors.black.withOpacity(0.1), BlendMode.dstATop),
                //         image: AssetImage('assets/a4.jpg'),
                //         fit: BoxFit.fitHeight),
                //   ),
                // ),
                // Container(
                //   color: Colors.black26,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: ph * (0.05)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.menu)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: ph * (0.06)),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(
                              'assets/a4.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Himmat Sandhu',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Hm_sandhu@1313',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        '',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                // Container(
                //   padding: EdgeInsets.only(
                //       top: 160.0, left: 30.0, right: 30.0, bottom: 30.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         'Hello',
                //         style: TextStyle(
                //           color: Colors.red,
                //           fontSize: 50.0,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: AssetImage('assets/a4.jpg'),
                      fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ),
                                      color: Colors.grey[200],
                                    ),
                                    child: TabBar(
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.black,
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                        color: Colors.red,
                                      ),
                                      tabs: const [
                                        Tab(
                                          text: 'Personal Info',
                                        ),
                                        Tab(
                                          text: 'Favourite',
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: TabBarView(
                                        children: [
                                          Column(
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                margin: EdgeInsets.all(8),
                                                elevation: 10,
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 25, 0),
                                                      title: Text('Titulo'),
                                                      subtitle: Text(
                                                          'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
                                                      leading: Icon(Icons.home),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                margin: EdgeInsets.all(8),
                                                elevation: 10,
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 25, 0),
                                                      title: Text('Email'),
                                                      subtitle: Text(
                                                          'hm@1313gmail.com'),
                                                      leading:
                                                          Icon(Icons.email),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                margin: EdgeInsets.all(8),
                                                elevation: 10,
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 25, 0),
                                                      title:
                                                          Text('Mobile Number'),
                                                      subtitle:
                                                          Text('09856514464'),
                                                      leading: Icon(Icons.call),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: 7,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Text('kamal'),
                                              );
                                            },
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 5.0,
                                              crossAxisSpacing: 5.0,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
