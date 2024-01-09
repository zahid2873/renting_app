import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/screen/details/renting_dates.dart';
import 'package:renting_app/screen/details/item_images.dart';
import 'package:renting_app/screen/details/owners_details.dart';
import 'package:renting_app/screen/details/payment_category.dart';
import 'package:renting_app/utils/textStyle.dart';
import 'package:renting_app/widget/customAppBar.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          item?.productName ?? "",
          style: FontStyle.titleMedium,
        ),
        action: const Padding(
          padding: EdgeInsets.only(right: 14),
          child: CircleAvatar(
              backgroundColor: ColorPalette.grey,
              child: Icon(
                Icons.favorite,
                color: ColorPalette.blue,
              )),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          ItemImages(
            image: item?.productImg,
            distance: item?.distance,
            isAvailable: item?.available ?? false,
            rating: calculateRating(item),
          ),
          OwnerDetails(
            ownerName: item?.ownerName,
            ownerImg: item?.ownerImg,
            rating: double.parse(calculateRating(item)),
          ),
          PaymentCategory(
            pricePerHour: item?.pricePerHour,
            pricePerDay: item?.pricePerDay,
            pricePermth: item?.pricePerMonth,
          ),
           RentingDates(pricePerDays: item?.pricePerDay??0.0,),
        ]),
      ),
    );
  }

  String calculateRating(ItemModel? item) {
    double rating = 0.0;
    if (item!.rating == null) return "0.0";
    for (int i = 0; i < item.rating!.length; i++) {
      double r = item.rating?[i].rating ?? 0;

      rating = rating + r;
    }
    rating = rating / item.rating!.length;

    return rating.toStringAsFixed(1);
  }
}
