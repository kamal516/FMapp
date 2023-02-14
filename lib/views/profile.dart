import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:radioapp/controllers/channel_controller.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  double pw = Get.size.width;
  double ph = Get.size.height;

  final channelControler = Get.put(ChannelControler());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                )),
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Hm_sandhu@1313',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    // Center(
                    //   child: Text(
                    //     '',
                    //     style: TextStyle(
                    //         fontSize: 15, fontWeight: FontWeight.bold),
                    //   ),
                    // )
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
                                                color: Colors.grey,
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
                                                      title: Text(
                                                        'Address',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      subtitle: Text(
                                                          'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
                                                      leading: Icon(Icons.home),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Card(
                                                color: Colors.grey,
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
                                                      title: Text('Email',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      subtitle: Text(
                                                          'hm@1313gmail.com'),
                                                      leading:
                                                          Icon(Icons.email),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Card(
                                                color: Colors.grey,
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
                                                      title: Text(
                                                          'Mobile Number',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      subtitle:
                                                          Text('09856514464'),
                                                      leading: Icon(Icons.call),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          GetBuilder<ChannelControler>(
                                              builder: ((controller) {
                                            return GridView.builder(
                                              padding: EdgeInsets.only(top: 10),
                                              // shrinkWrap: true,
                                              itemCount: channelControler
                                                  .channelData.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.3,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  channelControler
                                                                      .channelData[
                                                                          index]
                                                                      .channelName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(20),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(channelControler
                                                                          .channelData[
                                                                              index]
                                                                          .channelImage),
                                                                      fit: BoxFit
                                                                          .fill),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.38)),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                            width: width * 0.3,
                                                            child: Center(
                                                              child: Text(
                                                                channelControler
                                                                    .channelData[
                                                                        index]
                                                                    .channelNumber
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 200,
                                                      childAspectRatio: 3 / 2,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10),
                                            );
                                          }))
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
