import '../helpers/asset_helper.dart';

class HotelModel {
  final String image;
  final String name;
  final String location;
  final String awayKilomiter;
  final double star;
  final int numberOfReview;
  final String price;
  final List<RoomModel> listRoomModel;
  HotelModel({
      required this.image,
      required this.name,
      required this.location,
      required this.awayKilomiter,
      required this.star,
      required this.numberOfReview,
      required this.price,
      required this.listRoomModel
  });
}
class RoomModel {
  final String image;
  final String name;
  final String cancellation;
  final String size;
  final String price;
  RoomModel({
    required this.image,
    required this.name,
    required this.cancellation,
    required this.size,
    required this.price
  });
}

final List<HotelModel> listHotel = [
  HotelModel(image: AssetHelper.hotel1, name: 'Viet Nam', location: 'Ha Noi', awayKilomiter: '200', star: 4.5, numberOfReview: 300, price: '300', listRoomModel: listRoom1),
  HotelModel(image: AssetHelper.hotel2, name: 'Viet Nam', location: 'Ha Noi', awayKilomiter: '200', star: 4.5, numberOfReview: 300, price: '300', listRoomModel: listRoom2),
  HotelModel(image: AssetHelper.hotel3, name: 'Viet Nam', location: 'Ha Noi', awayKilomiter: '200', star: 4.5, numberOfReview: 300, price: '300', listRoomModel: listRoom3),
];

final List<RoomModel> listRoom1 = [
  RoomModel(image: AssetHelper.hotel1, name: 'Phong1', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel2, name: 'Phong2', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel3, name: 'Phong3', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
];
final List<RoomModel> listRoom2 = [
  RoomModel(image: AssetHelper.hotel1, name: 'Phong1', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel2, name: 'Phong2', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel3, name: 'Phong3', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
];
final List<RoomModel> listRoom3 = [
  RoomModel(image: AssetHelper.hotel1, name: 'Phong1', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel2, name: 'Phong2', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
  RoomModel(image: AssetHelper.hotel3, name: 'Phong3', cancellation: 'Free Cancellation', size: 'Room Size : 27 m2', price: '300'),
];
