import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:radioapp/controllers/channel_controller.dart';

class ChannelScreen extends StatefulWidget {
  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  final channelControler = Get.put(ChannelControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Channels"),
          actions: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                label: GetX<ChannelControler>(
                  builder: (controller) =>
                      Text(channelControler.count.toString()),
                ))
          ],
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
