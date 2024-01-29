import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class RentingHours extends StatefulWidget {
  const RentingHours({super.key, required this.pricePerHour});
  final double pricePerHour;

  @override
  State<RentingHours> createState() => _DatesState();
}

class _DatesState extends State<RentingHours> {
  DateTime selectedDate = DateTime.now();
  int _currentIntValue = 0;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
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
                "$_currentIntValue Hours",
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              trailing: TextButton(
                  onPressed: () => _showIntegerDialog(context),
                  child: const Text("Set Hours")),
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
      ),
    );
  }

  _showIntegerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Select hours"),
            content: SingleChildScrollView(
              child: Column(
      children: <Widget>[
        SizedBox(height: 16),
        //Text('Default', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: _currentIntValue,
          minValue: 0,
          maxValue: 24,
          step: 1,
          haptics: true,
          onChanged: (value) => setState(() => _currentIntValue = value),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = _currentIntValue - 1;
                _currentIntValue = newValue.clamp(0, 24);
              }),
            ),
            Text('Current int value: $_currentIntValue'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = _currentIntValue + 1;
                _currentIntValue = newValue.clamp(0, 24);
              }),
            ),
          ],
        ),

      ],
    )
            ),
          );
        });
  }

  //  _showIntegerDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text("Select hours"),
  //           content: SingleChildScrollView(
  //             child: Column(
  //     children: <Widget>[
  //       SizedBox(height: 16),
  //       //Text('Default', style: Theme.of(context).textTheme.headline6),
  //       NumberPicker(
  //         value: _currentIntValue,
  //         minValue: 0,
  //         maxValue: 24,
  //         step: 1,
  //         haptics: true,
  //         onChanged: (value) => setState(() => _currentIntValue = value),
  //       ),
  //       SizedBox(height: 32),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           IconButton(
  //             icon: Icon(Icons.remove),
  //             onPressed: () => setState(() {
  //               final newValue = _currentIntValue - 1;
  //               _currentIntValue = newValue.clamp(0, 24);
  //             }),
  //           ),
  //           Text('Current int value: $_currentIntValue'),
  //           IconButton(
  //             icon: Icon(Icons.add),
  //             onPressed: () => setState(() {
  //               final newValue = _currentIntValue + 1;
  //               _currentIntValue = newValue.clamp(0, 24);
  //             }),
  //           ),
  //         ],
  //       ),

  //     ],
  //   )
  //           ),
  //         );
  //       });
  // }

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (BuildContext? context, Widget? child) {
  //       return MediaQuery(
  //           data:
  //               MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
  //           child: child!);
  //     },
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       hours = picked.hour;
  //     });
  //     print("hhhhhhhhhhh$hours");
  //     print({picked.hour.toString() + ':' + picked.minute.toString()});
  //   }
  // }

  // rentingDays() {
  //   days = (selectedDate.difference(DateTime.now()).inHours / 24).round();
  // }

  double totalPrice = 0.0;

  calclulateTotalPrice() {
    totalPrice = widget.pricePerHour * _currentIntValue.toDouble();
  }
}
