import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renting_app/screen/home/home.dart';

final GlobalKey<NavigatorState> key =
    GlobalKey<NavigatorState>(debugLabel: "routeNavigator");
GoRouter router =
    GoRouter(navigatorKey: key, initialLocation: "/home", routes: [
  GoRoute(
    name: "home",
    path: "/home",
    pageBuilder: (context, state) {
      return const MaterialPage(child: HomeScreen());
    },
  ),
]);
