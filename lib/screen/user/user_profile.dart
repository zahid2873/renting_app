import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/controller/commentController.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/screen/common/utils.dart';
import 'package:renting_app/utils/textStyle.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key, this.img, this.name, this.location, this.item});
  final String? img;
  final String? name;
  final String? location;
  final ItemModel? item;

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
          name ?? "",
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
              location ?? "",
              style: FontStyle.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => modalBottomSheet(context, item),
              borderRadius: BorderRadius.circular(50),
              child: const CircleAvatar(
                backgroundColor: ColorPalette.blue,
                child: FaIcon(
                  FontAwesomeIcons.message,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () => Utils.showAddressOnMap(location ?? ""),
              borderRadius: BorderRadius.circular(50),
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

  CommentControler controler = Get.put(CommentControler());
  modalBottomSheet(BuildContext context, ItemModel? item) {
    double rating = 1.0;
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorPalette.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rate this item.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rate) {
                        rating = rate;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: controler.commentController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          //   hintText: "Enter your comment",
                          labelText: "Comment",
                          filled: true,
                          fillColor: ColorPalette.blackWithOpacity),
                      maxLines: 5,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      onChanged: (value) {},
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          controler.addComment(item, rating);
                        },
                        child: const Text("Submit"))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
