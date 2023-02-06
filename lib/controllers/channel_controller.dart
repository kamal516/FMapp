import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:radioapp/models/channel_model.dart';

class ChannelControler extends GetxController {
  List<Channel> channelData = [];

  List<Channel> cartItem = List<Channel>.empty().obs;

  addToCart(Channel item) {
    cartItem.add(item);
  }

  double get totalPrice =>
      cartItem.fold(0, (sum, item) => sum + item.channelPrice);
  int get count => cartItem.length;

  adToFavorite(id) {
    var index = channelData.indexWhere((element) => element.id == id);
    channelData[index].favorite = !channelData[index].favorite;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    List<Channel> serverResponse = [
      Channel(
          id: 1,
          channelName: 'Punjabi',
          channelImage: "assets/f1.png",
          channelPrice: 56,
          favorite: false),
      Channel(
          id: 2,
          channelName: 'Marathi',
          channelImage: "assets/f2.jpeg",
          channelPrice: 45,
          favorite: false),
      Channel(
          id: 3,
          channelName: 'Telgu',
          channelImage: "assets/f3.jpeg",
          channelPrice: 12,
          favorite: false),
      Channel(
          id: 4,
          channelName: 'Hindi',
          channelImage: "assets/f4.jpeg",
          channelPrice: 56,
          favorite: false)
    ];
    channelData.addAll(serverResponse);
    update();
  }
}
