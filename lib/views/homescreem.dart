import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:radioapp/controllers/channel_controller.dart';
import 'package:radioapp/views/musicPlay_screen.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final channelControler = Get.put(ChannelControler());
  var datat;

  double pw = Get.size.width;
  double ph = Get.size.height;

  channelByCategoryList(var productlist) {
    if (productlist == null) {
      return GestureDetector(
          onTap: () {},
          child: Text(channelControler.channelData[0].channelList[0].name));
    } else {
      return GestureDetector(onTap: () {}, child: Text(productlist.name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        //   title: Text(
        //     'Music Booster',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
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
                Padding(
                  padding: EdgeInsets.only(left: 10, top: ph * (0.06)),
                  child: Row(
                    children: [
                      Text(
                        'CHOOSE YOUR \nGREATEST JAZZ LANGUAGE',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                                      datat =
                                          channelControler.channelData[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              radius: 55,
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  radius: 50,
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
                                                .channelData[index].channelName,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                      }),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Row(
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: GetBuilder<ChannelControler>(
                      builder: ((controller) {
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: datat == null
                                ? channelControler
                                    .channelData[0].channelList.length
                                : datat.channelList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color:
                                    // Color(0xff595353),
                                    Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.all(8),
                                elevation: 10,
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      contentPadding: EdgeInsets.all(1),
                                      title: Text(
                                          datat == null
                                              ? channelControler.channelData[0]
                                                  .channelList[0].name
                                              : datat.channelList[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      subtitle: Text('hm@1313gmail.com',
                                          style: TextStyle(color: Colors.grey)),
                                      leading: CircleAvatar(
                                          // radius: 30,
                                          child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(datat == null
                                                  ? channelControler
                                                      .channelData[0]
                                                      .channelList[0]
                                                      .imageUrl
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
          ],
        ));
  }
}
