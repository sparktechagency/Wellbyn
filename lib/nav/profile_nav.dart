import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/profile/base/caregiver_mode.dart';
import 'package:wellbyn/views/screen/profile/base/medical_info.dart';
import 'package:wellbyn/views/screen/profile/base/personal_info.dart';
import 'package:wellbyn/views/screen/profile/base/support_send.dart';
import 'package:wellbyn/views/screen/profile/setting.dart';
import 'package:wellbyn/views/screen/profile/support.dart';
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
            builder: (_) =>  PersonalInfo(),
          );
        }
        else if(settings.name == '/support') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => Support(),
          );
        }
        else if(settings.name == '/caregiver_mode') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => CaregiverScreen(),
          );
        }
        else if(settings.name == '/support_send') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => SupportSend(),
          );
        }

        else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  Setting(),
          );
        }
      },
    );
  }
}
