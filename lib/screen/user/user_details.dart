import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/screen/user/customer_info.dart';
import 'package:renting_app/screen/user/user_commnet.dart';
import 'package:renting_app/screen/user/user_profile.dart';
import 'package:renting_app/widget/customAppBar.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      appBar: CustomAppBar(
        backgroundColor: ColorPalette.black,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          color: Colors.white,
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: [
            UserProfile(),
            Customers(),
            UserComment(),
          ],
        ),
      ),
    );
  }
}
