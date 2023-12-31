import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/colorPalette.dart';
import 'package:renting_app/model/item_model.dart';
import 'package:renting_app/utils/textStyle.dart';

class LeaseList extends StatelessWidget {
  const LeaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16),
      height: MediaQuery.of(context).size.height - 300,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Lease Again",
              style: FontStyle.titleMedium,
            ),
            TextButton(
              onPressed: () {
                print("1111111111");
              },
              child: const Row(
                children: [
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14, color: ColorPalette.puple),
                  ),
                  SizedBox(width: 5),
                  FaIcon(
                    FontAwesomeIcons.angleRight,
                    size: 20,
                    color: ColorPalette.puple,
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 12),
          height: 240,
          child: ListView.builder(
              itemCount: itemList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const LeaseItem();
              }),
        )
      ]),
    );
  }
}

class LeaseItem extends StatelessWidget {
  const LeaseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Ink(
              //height: 180,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorPalette.grey,
                    ),
                    child: Stack(children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/category/outdoors_RecreationRb.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: FaIcon(
                          FontAwesomeIcons.heart,
                          size: 20,
                          color: ColorPalette.puple,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.star,
                              size: 20,
                              color: Colors.blue,
                            ),
                            Text(
                              "4.2",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const Text(
                    "Outdoor and Recreation",
                    style: FontStyle.titleSmall,
                  ),
                  const Row(
                    children: [
                      Text(
                        "\$13",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/hr",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
