import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/profile/medical_info.dart';
import 'package:wellbyn/views/screen/profile/personal_info.dart';
import 'package:wellbyn/views/screen/profile/setting.dart';
 // replace with your actual profile screen path
import '../utils/nab_ids.dart';

class ProfileNav extends StatefulWidget {
  const ProfileNav({super.key});

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profilenav),
      onGenerateRoute: (settings) {
        if (settings.name == '/personal_info') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const PersonalInfo(),
          );
        } else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  Setting(),
          );
        }
      },
    );
  }
}
