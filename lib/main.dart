import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wellbyn/themes/dart_theme.dart';
import 'package:wellbyn/themes/light_theme.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/message.dart';
import 'package:wellbyn/utils/token_service.dart';
import 'controllers/baseController/base_controller.dart';
import 'controllers/localization_controller.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';
import 'helpers/di.dart' as di;
import 'helpers/route.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Map<String, Map<String, String>> _languages = await di.init();
  await TokenService().init();
  runApp( MyApp(languages:_languages,));
  Get.put(BaseController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_ , child) {
              return GetMaterialApp(
                title: AppConstants.APP_NAME,
                debugShowCheckedModeBanner: false,
                navigatorKey: Get.key,
                 theme: themeController.darkTheme ? dark(): light(),
                defaultTransition: Transition.rightToLeft,
                locale: localizeController.locale,
                translations: Messages(languages: languages),
                fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
                transitionDuration: const Duration(milliseconds: 300),
                getPages: AppRoutes.page,
                initialRoute: AppRoutes.Splash,
              );
            }
        );
      }
      );
    }
    );

  }
}