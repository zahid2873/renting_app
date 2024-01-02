import 'package:flutter/material.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/screen/home/available_list.dart';
import 'package:renting_app/screen/home/lease_list.dart';
import 'package:renting_app/screen/home/rent_categories.dart';
import 'package:renting_app/widget/customAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeAppBar(),
              const RentCategories(),
              Container(
                padding: const EdgeInsets.only(top: 12, left: 16),
                // height: MediaQuery.of(context).size.height - 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: const Column(children: [
                  LeaseList(),
                  AvailableList(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
