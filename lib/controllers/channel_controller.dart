import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:radioapp/controllers/channelList_controller.dart';
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

  final _burrito = ChannelList(
    id: 1,
    imageUrl: 'assets/a1.jpg',
    name: 'The Offiench',
  );
  final _steak = ChannelList(
    id: 2,
    imageUrl: 'assets/f2.jpeg',
    name: 'Panorma',
  );
  final _pasta = ChannelList(
    id: 3,
    imageUrl: 'assets/A6.jpg',
    name: 'Classic',
  );
  final _ramen = ChannelList(
    id: 4,
    imageUrl: 'assets/f1.png',
    name: 'Hip-Hop',
  );
  fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    List<Channel> serverResponse = [
      Channel(
        id: 1,
        channelName: 'Punjabi',
        channelImage: "assets/f1.png",
        channelPrice: 56,
        channelNumber: '45.2',
        channelList: [_ramen, _pasta, _steak, _burrito, _ramen],
        channelType: 'Trending',
        favorite: false,
      ),
      Channel(
          id: 2,
          channelName: 'Marathi',
          channelImage: "assets/f2.jpeg",
          channelPrice: 45,
          channelNumber: '23.02',
          channelType: 'Hip-Hop',
          channelList: [_pasta, _steak, _burrito, _ramen],
          favorite: false),
      Channel(
          id: 3,
          channelName: 'Telgu',
          channelImage: "assets/f3.jpeg",
          channelPrice: 12,
          channelNumber: '72.9',
          channelType: 'Rock',
          channelList: [
            _steak,
            _burrito,
          ],
          favorite: false),
      Channel(
          id: 4,
          channelName: 'Hindi',
          channelImage: "assets/f4.jpeg",
          channelPrice: 56,
          channelNumber: '109.7',
          channelType: 'Electro',
          channelList: [
            _burrito,
            _steak,
            _burrito,
            _burrito,
            _steak,
            _burrito,
            _steak,
          ],
          favorite: false),
      Channel(
        id: 1,
        channelName: 'Punjabi',
        channelImage: "assets/f1.png",
        channelPrice: 56,
        channelNumber: '45.2',
        channelList: [_ramen],
        channelType: 'Classic',
        favorite: false,
      ),
      Channel(
          id: 2,
          channelName: 'Marathi',
          channelImage: "assets/f2.jpeg",
          channelPrice: 45,
          channelNumber: '23.02',
          channelType: 'Jazz',
          channelList: [_pasta, _steak, _burrito, _ramen],
          favorite: false),
      Channel(
          id: 3,
          channelName: 'Telgu',
          channelImage: "assets/f3.jpeg",
          channelPrice: 12,
          channelNumber: '72.9',
          channelType: 'Rock',
          channelList: [
            _steak,
            _burrito,
          ],
          favorite: false),
    ];
    final List<ChannelList> channelList = [
      _burrito,
      _steak,
      _pasta,
      _ramen,
    ];

    channelData.addAll(serverResponse);
    update();
  }
}
