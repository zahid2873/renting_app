import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/screen/user/user_details.dart';
import 'package:renting_app/utils/textStyle.dart';

class OwnerDetails extends StatelessWidget {
  const OwnerDetails(
      {super.key, this.ownerName, this.ownerImg, this.rating, this.item});
  final String? ownerName;
  final String? ownerImg;
  final double? rating;
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  ownerImg ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReJlZqg8h_KEyGmrr6wcjHmxxz6XYL14oX5w&usqp=CAU",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ownerName ?? "",
                    style: FontStyle.titleMedium,
                  ),
                  Row(
                    children: [
                      const Text(
                        "★★★★★",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "$rating",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserDetails(item: item))),
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              child: FaIcon(
                FontAwesomeIcons.angleRight,
                size: 20,
                color: ColorPalette.puple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
