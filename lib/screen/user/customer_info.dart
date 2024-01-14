import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:renting_app/constants/color_palette.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  static String image1Link =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU";
  static List<String> images = [
    image1Link,
    image1Link,
    image1Link,
    image1Link,
    image1Link
  ];
  @override
  Widget build(BuildContext context) {
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
                  imageList: images,
                  totalCount: images.length,
                  imageRadius: 35,
                  imageCount: 3,
                ),
                const SizedBox(height: 5),
                Text(
                  "${images.length} Customers",
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    Text(
                      "4.7",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "17 Reviews",
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
}
