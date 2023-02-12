import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:radioapp/controllers/channel_controller.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final channelControler = Get.put(ChannelControler());
  var datat;

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
      body: Column(
        children: [
          Expanded(child: GetBuilder<ChannelControler>(
            builder: ((controller) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: channelControler.channelData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            datat = channelControler.channelData[index];
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  channelControler
                                      .channelData[index].channelImage,
                                ),
                                fit: BoxFit.contain,
                              )),
                        ));
                  });
            }),
          )),
          Expanded(child: GetBuilder<ChannelControler>(
            builder: ((controller) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: datat == null
                      ? channelControler.channelData[0].channelList.length
                      : datat.channelList.length,
                  itemBuilder: (context, index) {
                    return Text(datat == null
                        ? channelControler.channelData[0].channelList[0].name
                        : datat.channelList[index].name);
                    //channelByCategoryList(datat.channelList);
                  });
            }),
          ))
        ],
      ),
    );
  }
}
