import 'dart:ffi';

import 'package:radioapp/controllers/channelList_controller.dart';

class Channel {
  final int id;
  final String channelName;
  final String channelImage;
  final double channelPrice;
  final String channelType;
  final String channelNumber;
  final List<ChannelList> channelList;
  bool favorite;

  Channel(
      {required this.id,
      required this.channelName,
      required this.channelImage,
      required this.channelPrice,
      required this.channelType,
      required this.channelNumber,
      required this.channelList,
      required this.favorite});
}
