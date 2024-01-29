import 'package:flutter/material.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/screen/details/renting_dates.dart';
import 'package:renting_app/screen/details/renting_hours.dart';
import 'package:renting_app/utils/textStyle.dart';

//enum Payment { hourly, monthly, yearly }

class PaymentCategory extends StatefulWidget {
  const PaymentCategory(
      {super.key, this.pricePerHour, this.pricePerDay, this.pricePermth});
  final double? pricePerHour;
  final double? pricePerDay;
  final double? pricePermth;

  @override
  State<PaymentCategory> createState() => _PaymentCategoryState();
}

class _PaymentCategoryState extends State<PaymentCategory> {
  int stackIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              widget.pricePerHour != null
                  ? Expanded(
                      flex: 1,
                      child: PaymentCategoryItem(
                        paymentCategory: "Hourly",
                        price: "\$${widget.pricePerHour} /",
                        type: "hour",
                        isActive: stackIndex == 0 ? true : false,
                        onTap: () => changeStackIndex(0),
                      ))
                  : const SizedBox(),
              const SizedBox(width: 10),
              widget.pricePerDay != null
                  ? Expanded(
                      flex: 1,
                      child: PaymentCategoryItem(
                        paymentCategory: "Daily",
                        price: "\$${widget.pricePerDay} /",
                        type: "day",
                        isActive: stackIndex == 1 ? true : false,
                        onTap: () => changeStackIndex(1),
                      ))
                  : const SizedBox(),
              const SizedBox(width: 10),
              widget.pricePermth != null
                  ? Expanded(
                      flex: 1,
                      child: PaymentCategoryItem(
                        paymentCategory: "Monthly",
                        price: "\$${widget.pricePermth} /",
                        type: "mth",
                        isActive: stackIndex == 2 ? true : false,
                        onTap: () => changeStackIndex(2),
                      ))
                  : const SizedBox(),
            ],
          ),
          IndexedStack(
            index: stackIndex,
            children: [
              SizedBox(
                height: stackIndex == 0 ? null : 1,
                child: RentingHours(
                  pricePerHour: widget.pricePerHour ?? 0.0,
                ),
              ),
              SizedBox(
                height: stackIndex == 1 ? null : 1,
                child: RentingDates(
                  pricePerDays: widget.pricePerDay ?? 0.0,
                ),
              ),
              SizedBox(height: stackIndex == 2 ? null : 1),
            ],
          )
        ],
      ),
    );
  }

  void changeStackIndex(int index) {
    setState(() {
      stackIndex = index;
    });
  }
}

class PaymentCategoryItem extends StatelessWidget {
  PaymentCategoryItem({
    super.key,
    this.paymentCategory,
    this.price,
    this.isSelected = false,
    this.isActive = false,
    VoidCallback? onTap,
    this.type,
  }) : onTap = onTap ?? (() {});
  bool isActive;
  final String? paymentCategory;
  final String? price;
  final String? type;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isActive ? ColorPalette.black : ColorPalette.grey),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            paymentCategory ?? "",
            style: isActive
                ? const TextStyle(fontSize: 16, color: ColorPalette.white)
                : FontStyle.labelLarge,
          ),
          const SizedBox(height: 5),
          Text(
            price ?? "",
            style: isActive
                ? const TextStyle(fontSize: 16, color: ColorPalette.white)
                : FontStyle.labelLarge,
          ),
          Text(
            type ?? "",
            style: isActive
                ? const TextStyle(fontSize: 16, color: ColorPalette.white)
                : FontStyle.labelLarge,
          ),
        ]),
      ),
    );
  }
}
