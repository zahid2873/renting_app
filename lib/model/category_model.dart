import 'dart:ui';

import 'package:renting_app/constants/color_palette.dart';


class CategoryModel {
  String? categoryName;
  String? img;
  Color? color;
  CategoryModel({this.categoryName, this.color, this.img});
}

List<CategoryModel> categoryList = [
  CategoryModel(
      categoryName: "Soprts",
      color: ColorPalette.green,
      img: "assets/category/sportsRb.png"),
  CategoryModel(
      categoryName: "Electronics",
      color: ColorPalette.puple,
      img: "assets/category/electronicsRb.png"),
  CategoryModel(
      categoryName: "Tools",
      color: ColorPalette.pink,
      img: "assets/category/toolsRb.png"),
  CategoryModel(
      categoryName: "Real Estate",
      color: ColorPalette.yellow,
      img: "assets/category/real_stateRb.png"),
  CategoryModel(
      categoryName: "Vehicles",
      color: ColorPalette.green,
      img: "assets/category/vehiclesRb.png"),
  CategoryModel(
      categoryName: "Clothing and Accessories",
      color: ColorPalette.puple,
      img: "assets/category/clothing_accesoriesRb.png"),
  CategoryModel(
      categoryName: "Outdoor and Recreation",
      color: ColorPalette.pink,
      img: "assets/category/outdoors_RecreationRb.png"),
  CategoryModel(
      categoryName: "Party and Events",
      color: ColorPalette.yellow,
      img: "assets/category/party_eventsRb.png"),
  CategoryModel(
      categoryName: "Books and Education",
      color: ColorPalette.green,
      img: "assets/category/books_educationRb.png"),
];
