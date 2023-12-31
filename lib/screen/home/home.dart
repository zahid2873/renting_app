import 'package:flutter/material.dart';
import 'package:renting_app/constants/colorPalette.dart';
import 'package:renting_app/screen/home/lease_list.dart';
import 'package:renting_app/screen/home/rent_categories.dart';
import 'package:renting_app/widget/customAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(),
               RentCategories(),
               LeaseList(),
            ],
          ),
        ),
      ),
    );
  }
}
