import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/screen/common/bottom_navigation_bar.dart';
import 'package:renting_app/screen/common/utils.dart';
import 'package:renting_app/screen/home/available_list.dart';
import 'package:renting_app/screen/home/lease_list.dart';
import 'package:renting_app/screen/home/rent_categories.dart';
import 'package:renting_app/utils/textStyle.dart';
import 'package:renting_app/widget/customAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: ColorPalette.white,
            size: 24,
          ),
        ),
        title: const AppBarTitle(),
        action: const Badge(
          alignment: Alignment(1, -1.5),
          backgroundColor: ColorPalette.blue,
          child: FaIcon(
            FontAwesomeIcons.bell,
            color: ColorPalette.white,
            size: 24,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RentCategories(),
            Container(
              padding: const EdgeInsets.only(top: 12, left: 16),
              // height: MediaQuery.of(context).size.height - 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(35)),
              child: const Column(children: [
                LeaseList(),
                AvailableList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Utils.showAddressOnMap("Dhaka Bangladesh"),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Ink(
          padding: const EdgeInsets.only(left: 12),
          height: 40,
          width: 150,
          decoration: const BoxDecoration(
              color: ColorPalette.blackWithOpacity,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.locationDot,
                color: ColorPalette.white,
                size: 16,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    text: "Dhaka, Bnagladesh",
                    style: FontStyle.labelMedium,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
