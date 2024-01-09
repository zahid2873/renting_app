import 'package:flutter/material.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class PaymentCategory extends StatelessWidget {
  const PaymentCategory(
      {super.key, this.pricePerHour, this.pricePerDay, this.pricePermth});
  final double? pricePerHour;
  final double? pricePerDay;
  final double? pricePermth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
      child: Row(
        children: [
          pricePerHour != null
              ? Expanded(
                  flex: 1,
                  child: PaymentCategoryItem(
                    paymentCategory: "Hourly",
                    price: "\$$pricePerHour / hour",
                  ))
              : const SizedBox(),
          const SizedBox(width: 10),
          pricePerDay != null
              ? Expanded(
                  flex: 1,
                  child: PaymentCategoryItem(
                    paymentCategory: "Daily",
                    price: "\$$pricePerDay / day",
                    color: ColorPalette.black,
                  ))
              : const SizedBox(),
          const SizedBox(width: 10),
          pricePermth != null
              ? Expanded(
                  flex: 1,
                  child: PaymentCategoryItem(
                    paymentCategory: "Monthly",
                    price: "\$$pricePermth / mth",
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class PaymentCategoryItem extends StatelessWidget {
  PaymentCategoryItem({
    super.key,
    this.paymentCategory,
    this.price,
    this.color,
    this.isSelected = false,
    VoidCallback? onTap,
  }) : onTap = onTap ?? (() {});
  final String? paymentCategory;
  final String? price;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color ?? ColorPalette.grey),
        child: Column(children: [
          Text(
            paymentCategory ?? "",
            style: color == ColorPalette.black
                ? const TextStyle(fontSize: 16, color: ColorPalette.white)
                : FontStyle.labelLarge,
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              price ?? "",
              style: color == ColorPalette.black
                  ? const TextStyle(fontSize: 16, color: ColorPalette.white)
                  : FontStyle.labelLarge,
            ),
          ),
        ]),
      ),
    );
  }
}
