import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: ColorPalette.white,
                    size: 24,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  height: 40,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: ColorPalette.blackWithOpacity,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: ColorPalette.white,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            text: "Dhaka, Bnagladesh",
                            style: FontStyle.labelMedium,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.bell,
                  color: ColorPalette.white,
                  size: 24,
                )
              ]),
        ),
        Positioned(
          top: 18,
          right: 10,
          child: Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          ),
        )
      ],
    );
  }
}
