import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/utils/textStyle.dart';

class AvailableList extends StatefulWidget {
  const AvailableList({super.key});

  @override
  State<AvailableList> createState() => _AvailableListState();
}

class _AvailableListState extends State<AvailableList> {
  @override
  void initState() {
    super.initState();
    getAvailableList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available now",
          style: FontStyle.titleMedium,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, right: 16),
          child: ListView.builder(
              itemCount: availableList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return AvailableItem(
                  name: availableList[index].productName,
                  img: availableList[index].productImg,
                  available: itemList[index].available,
                  rating: calculateRating(index),
                  pricePerHour: itemList[index].pricePerHour,
                  distance: availableList[index].distance,
                );
              })),
        ),
      ],
    );
  }

  List<ItemModel> availableList = [];

  getAvailableList() {
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i].available == true) {
        availableList.add(itemList[i]);
      }
    }
  }

  String calculateRating(int index) {
    double rating = 0.0;
    if (itemList[index].rating == null) return "0.0";
    for (int i = 0; i < itemList[index].rating!.length; i++) {
      double r = itemList[index].rating?[i].rating ?? 0;

      rating = rating + r;
    }
    rating = rating / itemList[index].rating!.length;

    return rating.toStringAsFixed(1);
  }
}

class AvailableItem extends StatelessWidget {
  AvailableItem({
    super.key,
    this.name,
    this.img,
    this.available = false,
    this.rating,
    this.pricePerHour,
    this.distance,
    VoidCallback? onTap,
  }) : onTap = onTap ?? (() {});
  final String? name;
  final String? img;
  final bool? available;
  final String? rating;
  final double? pricePerHour;
  final double? distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: Ink(
            height: 100,
            decoration: BoxDecoration(
              color: ColorPalette.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: ColorPalette.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                        "assets/category/outdoors_RecreationRb.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "",
                        style: FontStyle.titleSmall,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: Colors.black,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${distance}km",
                                style: FontStyle.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "\$$pricePerHour /hr",
                            style: FontStyle.labelLarge,
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                rating ?? "0.0",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
                const Positioned(
                  top: 15,
                  right: 15,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
