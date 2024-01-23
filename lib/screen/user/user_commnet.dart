import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/controller/commentController.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/utils/textStyle.dart';

class UserComment extends StatefulWidget {
  const UserComment({super.key, this.comment});
  final List<CommnetModel>? comment;

  @override
  State<UserComment> createState() => _UserCommentState();
}

class _UserCommentState extends State<UserComment> {
    CommentControler controler = Get.find<CommentControler>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //controler.addComment(item, rating)
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Divider(
            height: 10,
            thickness: 6,
            indent: 160,
            endIndent: 160,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(right: 16, top: 12, left: 16),
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.builder(
                itemCount: widget.comment?.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return CommnetItem(
                    name: widget.comment?[index].name,
                    img: widget.comment?[index].img,
                    rating: widget.comment?[index].rating.toString(),
                    comment: widget.comment?[index].comment,
                  );
                })),
          ),
        ],
      ),
    );
  }
}

class CommnetItem extends StatelessWidget {
  const CommnetItem({
    super.key,
    this.name,
    this.img,
    this.rating,
    this.comment,
  });
  final String? name;
  final String? img;
  final String? rating;
  final String? comment;

  static Color color = ColorPalette.blue;
  static String? type;

  @override
  Widget build(BuildContext context) {
    commentType(rating);
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        img ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Badge(
                                  alignment: const Alignment(1.4, .2),
                                  backgroundColor: Colors.black,
                                  smallSize: 3,
                                  child: Text(
                                    name ?? "",
                                    style: FontStyle.titleSmall,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  type ?? "",
                                  style: TextStyle(color: color, fontSize: 14),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: color,
                                ),
                                Text(
                                  rating ?? "",
                                  style: TextStyle(fontSize: 16, color: color),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          comment ?? "",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  commentType(String? rating) {
    if (rating == null) return;
    double rate = double.parse(rating);
    if (rate == 5) {
      color = ColorPalette.green;
      type = "Excellent";
    } else if (rate == 4) {
      color = ColorPalette.puple;
      type = "Great";
    } else if (rate == 3) {
      color = ColorPalette.blue;
      type = "Average";
    } else {
      color = ColorPalette.pink;
      type = "Bad";
    }
  }
}
