import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';

import '../utils/nab_ids.dart';

class HomeNav extends StatelessWidget {
   HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/details') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  HomeScreen(),
          );
        } else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  HomeScreen(),
          );
        }
      },
    );
  }
}
