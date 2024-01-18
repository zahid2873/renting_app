import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/screen/common/utils.dart';
import 'package:renting_app/utils/textStyle.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, this.img, this.name, this.location});
  final String? img;
  final String? name;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            img ??
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
         Text(
          name??"",
          style: FontStyle.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.locationDot,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 5),
            Text(
              location??"",
              style: FontStyle.labelMedium,
            ),
          ],
        ),
       
        const SizedBox(height: 10),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: ColorPalette.blue,
              child: FaIcon(
                FontAwesomeIcons.message,
                color: Colors.white,
                size: 20,
              ),
            ),
           const  SizedBox(width: 15),
            InkWell(
              onTap: () => Utils.showAddressOnMap(location??""),
              child: const CircleAvatar(
                backgroundColor: ColorPalette.green,
                child: FaIcon(
                  FontAwesomeIcons.map,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
