import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/utils/textStyle.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Divider(
            height: 10,
            thickness: 6,
            indent: 160,
            endIndent: 160,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(right: 16, top: 12, left: 16),
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return CommnetItem();
                })),
          ),
        ],
      ),
    );
  }
}

class CommnetItem extends StatelessWidget {
  CommnetItem({
    super.key,
    this.name,
    this.img,
    this.available = false,
    this.rating,
    this.pricePerHour,
    this.distance,
    VoidCallback? onTap,
  }) : onTap = onTap ?? (() {});
  final String? name;
  final String? img;
  final bool? available;
  final String? rating;
  final double? pricePerHour;
  final double? distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                color: ColorPalette.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHeO3Q5zGljjQWl4LVgPw6U3WPzGi6BGIdA&usqp=CAU",
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Mahdi Hasan",
                                style: FontStyle.titleSmall,
                              ),
                              SizedBox(width: 10),
                              Text("Exceelent"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              Text(
                                "5.0",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Very good prices!! love it.",
                        style: FontStyle.labelLarge,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


// Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(25),
//           onTap: () {},
//           child: Ink(
//             height: 100,
//             decoration: BoxDecoration(
//               color: ColorPalette.grey,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Stack(
//               children: [
//                 Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//                   Container(
//                     margin: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         color: ColorPalette.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Image.asset(
//                         "assets/category/outdoors_RecreationRb.png"),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name ?? "",
//                         style: FontStyle.titleSmall,
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const FaIcon(
//                                 FontAwesomeIcons.locationDot,
//                                 color: Colors.black,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 5),
//                               Text(
//                                 "${distance}km",
//                                 style: FontStyle.labelLarge,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             "\$$pricePerHour /hr",
//                             style: FontStyle.labelLarge,
//                           ),
//                           const SizedBox(width: 10),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.blue,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 5),
//                               Text(
//                                 rating ?? "0.0",
//                                 style: const TextStyle(
//                                     fontSize: 16, color: Colors.blue),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ]),
//                 const Positioned(
//                   top: 15,
//                   right: 15,
//                   child: Icon(
//                     Icons.favorite,
//                     color: Colors.blue,
//                     size: 24,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
  
