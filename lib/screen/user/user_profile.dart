import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Mahdi Hasan",
          style: FontStyle.titleLarge,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.locationDot,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 5),
            Text(
              "Dhaka, Bangladesh",
              style: FontStyle.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: ColorPalette.blue,
              child: FaIcon(
                FontAwesomeIcons.message,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(width: 15),
            CircleAvatar(
              backgroundColor: ColorPalette.green,
              child: FaIcon(
                FontAwesomeIcons.map,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
