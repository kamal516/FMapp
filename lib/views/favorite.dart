import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radioapp/controllers/channel_controller.dart';
import 'package:radioapp/views/musicPlay_screen.dart';

class fav extends StatefulWidget {
  const fav({Key? key}) : super(key: key);

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  final channelControler = Get.put(ChannelControler());

  double pw = Get.size.width;
  double ph = Get.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: ph * (0.06)),
            child: Row(
              children: [
                Text(
                  'FIND YOUR BEST MUSIC',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: ph * (0.01), left: 10, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Search',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            prefixIcon: Container(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              width: 18,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Row(
              children: [
                Text(
                  'Favourite',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: GetBuilder<ChannelControler>(
                builder: ((controller) {
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 1),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 15,
                      //  channelControler.channelData[0].channelList ==
                      //         null
                      //     ? 0
                      //     : channelControler.channelData[0].channelList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color:
                              //Color(0xff595353),
                              Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(8),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                contentPadding: EdgeInsets.all(1),
                                title: Text('The Panorma',
                                    // channelControler
                                    //     .channelData[3].channelList[3].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                subtitle: Text('hm@1313gmail.com',
                                    style: TextStyle(color: Colors.grey)),
                                leading: CircleAvatar(
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
                                        onPressed: () async {},
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ))
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
      ),
    ]));
  }
}
