import 'package:flutter/material.dart';
import 'package:renting_app/utils/textStyle.dart';

class PaymentCategory extends StatelessWidget {
  const PaymentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          PaymentCategoryItem(),
        ],
      ),
    );
  }
}

class PaymentCategoryItem extends StatelessWidget {
  const PaymentCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      color: Colors.amber,
      child: Column(children: [
        Text(
          "Hourly",
          style: FontStyle.labelLarge,
        ),
        Text(
          "300.0 / hr",
          style: FontStyle.labelLarge,
        ),
      ]),
    );
  }
}
