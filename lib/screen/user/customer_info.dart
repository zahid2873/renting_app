import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/model/item_model.dart';

class Customers extends StatelessWidget {
  const Customers({super.key, this.commnetModel});
  final List<CommnetModel>? commnetModel;

  static String image1Link =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU";
  static List<String> images = [];
  static String? totalRating;

  @override
  Widget build(BuildContext context) {
    calculateRating(commnetModel);
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 20, right: 16),
      height: 100,
      width: double.infinity,
      child: Row(children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorPalette.blackWithOpacity,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageStack(
                  imageList: imageList(),
                  totalCount: imageList().length,
                  imageRadius: 35,
                  imageCount: 3,
                ),
                const SizedBox(height: 5),
                Text(
                  "${commnetModel?.length.toString()} Customers",
                  style: TextStyle(
                      fontSize: 14, color: ColorPalette.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorPalette.blackWithOpacity,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    Text(
                      totalRating ?? "0.0",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "${commnetModel?.length.toString()}",
                  style: TextStyle(
                      fontSize: 14, color: ColorPalette.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: ColorPalette.blackWithOpacity,
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "7 items",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 15),
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 14, color: ColorPalette.grey.withOpacity(0.5)),
              )
            ]),
          ),
        )
      ]),
    );
  }

  List<String> imageList() {
    images.clear();
    for (CommnetModel comment in commnetModel!) {
      images.add(comment.img ??
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU");
    }
    return images;
  }

  calculateRating(List<CommnetModel>? item) {
    double rating = 0.0;
    if (commnetModel == null) return;
    for (int i = 0; i < commnetModel!.length; i++) {
      double r = commnetModel?[i].rating ?? 0;

      rating = rating + r;
    }
    rating = rating / commnetModel!.length;

    totalRating = rating.toStringAsFixed(1);
  }
}
