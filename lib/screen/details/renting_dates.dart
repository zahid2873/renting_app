import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class RentingDates extends StatefulWidget {
  const RentingDates({super.key, required this.pricePerDays});
  final double pricePerDays;

  @override
  State<RentingDates> createState() => _DatesState();
}

class _DatesState extends State<RentingDates> {
  DateTime selectedDate = DateTime.now();
  int days = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ListTile(
            tileColor: ColorPalette.blue.withOpacity(0.2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            leading: const FaIcon(
              FontAwesomeIcons.calendar,
              size: 20,
            ),
            title: Text(
              "$days Days",
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            trailing: TextButton(
                onPressed: () => _selectDate(context),
                child: const Text("Set Dates")),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
                color: ColorPalette.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Lease for $totalPrice\$",
              style: FontStyle.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        rentingDays();
        calclulateTotalPrice();
      });
    }
  }

  rentingDays() {
    days = (selectedDate.difference(DateTime.now()).inHours / 24).round() + 1;
  }

  double totalPrice = 0.0;

  calclulateTotalPrice() {
    totalPrice = widget.pricePerDays * days.toDouble();
  }
}
