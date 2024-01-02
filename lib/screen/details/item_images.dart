import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class ItemImages extends StatelessWidget {
  const ItemImages(
      {super.key, this.image, this.rating, this.distance, this.isAvailable});
  final String? image;
  final String? rating;
  final double? distance;
  final bool? isAvailable;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(left: 16, bottom: 12),
      alignment: Alignment.bottomLeft,
      height: 300,
      decoration: BoxDecoration(
          color: ColorPalette.grey,
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage(
                image ?? "",
              ),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  "${distance}km",
                  style: FontStyle.labelMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const SizedBox(width: 5),
                isAvailable == true
                    ? const Text(
                        "Available",
                        style: FontStyle.labelMedium,
                      )
                    : const Text(
                        "Unavailable",
                        style: FontStyle.labelMedium,
                      ),
              ],
            ),
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
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
