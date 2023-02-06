import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:radioapp/models/channel_model.dart';

class channelControler extends GetxController {
  List<Channel> channelData = [];

  fetchData() {
    List<Channel> serverResponse = [
      Channel(
          id: 1,
          channelName: 'Punjabi',
          channelImage: "assets/f1.png",
          channelPrice: "56",
          favorite: false),
      Channel(
          id: 2,
          channelName: 'Marathi',
          channelImage: "assets/f2.jpeg",
          channelPrice: "56",
          favorite: false),
      Channel(
          id: 3,
          channelName: 'Telgu',
          channelImage: "assets/f3.jpeg",
          channelPrice: "56",
          favorite: false),
      Channel(
          id: 4,
          channelName: 'Hindi',
          channelImage: "assets/f4.jpeg",
          channelPrice: "56",
          favorite: false)
    ];
    channelData.addAll(serverResponse);
  }
}
