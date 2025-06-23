import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';

import '../utils/nab_ids.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});
  //
  // Created by CodeWithFlexZ
  // Tutorials on my YouTube
  //
  //! Instagram
  //! @CodeWithFlexZ
  //
  //? GitHub
  //? AmirBayat0
  //
  //* YouTube
  //* Programming with FlexZ
  //
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/details') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const HomeScreen(),
          );
        } else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const HomeScreen(),
          );
        }
      },
    );
  }
}
