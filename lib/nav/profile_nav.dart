import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/profile/add_insurance.dart';
import 'package:wellbyn/views/screen/profile/caregiver_mode/caregiver_edits.dart';
import 'package:wellbyn/views/screen/profile/caregiver_mode/caregiver_mode_details.dart';
import 'package:wellbyn/views/screen/profile/caregiver_mode/start_caregiver.dart';
import 'package:wellbyn/views/screen/profile/medication/medication_edit.dart';
import 'package:wellbyn/views/screen/profile/upload_document_screen/upload_document_screen.dart';
import 'package:wellbyn/views/screen/profile/waitlist/waitlist_screen.dart';
 // replace with your actual profile screen path
import '../utils/nab_ids.dart';
import '../views/screen/profile/caregiver_mode/caregiver_mode.dart';
import '../views/screen/profile/insurance_info.dart';
import '../views/screen/profile/medicalinfo/medical_info.dart';
import '../views/screen/profile/medication/medicationsetting.dart';
import '../views/screen/profile/personalinfo/personal_info.dart';
import '../views/screen/profile/setting.dart';
import '../views/screen/profile/support/support.dart';
import '../views/screen/profile/support/support_send.dart';

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
        else if(settings.name == '/insurance_info') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => InsuranceInfo(),
          );
        }
        else if(settings.name == '/medication_edit') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => MedicationEdit(),
          );
        }
        else if(settings.name == '/medicationsetting') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => MedicationSetting(),
          );
        }
        else if(settings.name == '/add_insurance') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => AddInsurance(),
          );
        }
        else if(settings.name == '/caregiver_mode') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => CaregiverScreen(),
          );
        }
        else if(settings.name =="/medical_info"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => MedicalInformationScreen(),
          );
        }else if(settings.name =="/waitlist_screen"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => WaitlistScreen(),
          );
        }else if(settings.name =="/start_caregiver"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => StartCaregiver(),
          );
        }
        else if(settings.name =="/caregiver_mode_details"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => CaregiverModeDetails(),
          );
        }
        else if(settings.name =="/caregiver_edits"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => CaregiverEdits(),
          );
        }
        else if(settings.name =="/upload_document_screen"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => UploadDocumentScreen(),
          );
        }
        else if(settings.name == '/support_send') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => SupportSend(),
          );
        }
        else if(settings.name == '/setting') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => Setting(),
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
