import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getwidget/getwidget.dart';

import 'package:radioapp/controllers/channel_controller.dart';
import 'package:radioapp/views/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChannelScreen extends StatefulWidget {
  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  TextEditingController search = new TextEditingController();
  final channelControler = Get.put(ChannelControler());
  GlobalKey bottomNavigationKey = GlobalKey();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Channels"),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', false);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => IntroductionScreen()));
                  },
                  icon: Icon(Icons.logout),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                    label: GetX<ChannelControler>(
                      builder: (controller) =>
                          Text(channelControler.count.toString()),
                    ))
              ],
            )
          ],
        ),
        drawer: GFDrawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GFDrawerHeader(
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                ),
                otherAccountsPictures: <Widget>[
                  Image(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                    fit: BoxFit.cover,
                  ),
                  GFAvatar(
                    child: Text("ab"),
                  )
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('user name'),
                    Text('user@userid.com'),
                  ],
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: null,
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: null,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ChannelControler>(
                builder: ((controller) {
                  return ListView.builder(
                      itemCount: channelControler.channelData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.asset(
                                    channelControler
                                        .channelData[index].channelImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          channelControler.adToFavorite(
                                              channelControler
                                                  .channelData[index].id);
                                        },
                                        icon: Icon(channelControler
                                                .channelData[index].favorite
                                            ? Icons.favorite
                                            : Icons.favorite_border)),
                                    RaisedButton(
                                      onPressed: () {
                                        channelControler.addToCart(
                                            channelControler
                                                .channelData[index]);
                                      },
                                      child: Text("add"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetX<ChannelControler>(
                builder: (controller) => Text(
                      "Total amt  :  ${channelControler.totalPrice}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))
          ],
        ));
  }
}
