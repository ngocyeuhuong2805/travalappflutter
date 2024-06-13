import 'package:travel_app/core/model/list_image.dart';

class Destinations {
  final String id;
  final String name;
  final String image;
  final String title;
  final String background;
  final List<ListImage> imageList;
  Destinations({required this.id, required this.name, required this.image, required this.title, required this.imageList,required this.background});
}