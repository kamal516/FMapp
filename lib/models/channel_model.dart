class Channel {
  final int id;
  final String channelName;
  final String channelImage;
  final String channelPrice;
  bool favorite;

  Channel(
      {required this.id,
      required this.channelName,
      required this.channelImage,
      required this.channelPrice,
      required this.favorite});
}
