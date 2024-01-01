import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/colorPalette.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/utils/textStyle.dart';

class LeaseList extends StatelessWidget {
  const LeaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Lease Again",
            style: FontStyle.titleMedium,
          ),
          TextButton(
            onPressed: () {
              print("1111111111");
            },
            child: const Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: ColorPalette.puple),
                ),
                SizedBox(width: 5),
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: 20,
                  color: ColorPalette.puple,
                )
              ],
            ),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.only(top: 12),
        height: 230,
        child: ListView.builder(
            itemCount: itemList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return LeaseItem(
                name: itemList[index].productName,
                img: itemList[index].productImg,
                available: itemList[index].available,
                rating: calculateRating(index),
                pricePerHour: itemList[index].pricePerHour,
              );
            }),
      )
    ]);
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

class LeaseItem extends StatelessWidget {
  LeaseItem({
    super.key,
    this.name,
    this.img,
    this.available = false,
    this.rating,
    this.pricePerHour,
    VoidCallback? onTap,
  }) : onTap = onTap ?? (() {});
  final String? name;
  final String? img;
  final bool? available;
  final String? rating;
  final double? pricePerHour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: Ink(
              //height: 180,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorPalette.grey,
                    ),
                    child: Stack(children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          "$img",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: available ?? false
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.blue,
                                size: 20,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.heart,
                                size: 20,
                                color: Colors.blue,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.star,
                              size: 20,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              rating ?? "0.0",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  RichText(
                    text:
                        TextSpan(text: name ?? "", style: FontStyle.titleSmall),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$$pricePerHour",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "/hr",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
