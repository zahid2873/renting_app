// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:renting_app/constants/colorPalette.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//         backgroundColor: ColorPalette.white,
//         onDestinationSelected: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         selectedIndex: currentIndex,
//         indicatorColor: ColorPalette.blue,
//         destinations: const [
//           NavigationDestination(
//             label: "Home",
//             icon: FaIcon(
//               FontAwesomeIcons.house,
//               size: 20,
//             ),
//           ),
//           NavigationDestination(
//             label: "Favorite",
//             icon: FaIcon(
//               FontAwesomeIcons.heart,
//               size: 20,
//             ),
//           ),
//           NavigationDestination(
//             label: "Add",
//             icon: FaIcon(
//               FontAwesomeIcons.plus,
//               size: 20,
//             ),
//           ),
//           NavigationDestination(
//             label: "Message",
//             icon: FaIcon(
//               FontAwesomeIcons.message,
//               size: 20,
//             ),
//           ),
//           NavigationDestination(
//             label: "Profile",
//             icon: FaIcon(
//               FontAwesomeIcons.person,
//               size: 20,
//             ),
//           )
//         ]);
//   }
// }
