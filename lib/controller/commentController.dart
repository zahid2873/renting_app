import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:renting_app/model/item_model.dart';

class CommentControler  extends GetxController {
  TextEditingController commentController = TextEditingController();
 addComment(ItemModel? item,  double rating) {
    item?.rating?.insert(
        0,
        CommnetModel(
            name: "Zahid",
            img:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU",
            rating: rating,
            comment: commentController.text));
  }
}