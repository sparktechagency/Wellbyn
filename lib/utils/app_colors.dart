import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{

  static Color primaryColor=const Color(0xFFFFD400);
  static Color secendryColor=const Color(0xFFFFFBE8);
  static Color backgroundColor=const Color(0xFF010101);
  static Color cardColor = const Color(0xFF2F2F2F);
  static Color cardLightColor = const Color(0xFF555555);
  static Color borderColor = const Color(0xFFD9B912);
  static Color textColor = const Color(0xFF1B1B1B);
  static Color subTextColor = const Color(0xFF666768);
  static Color hintColor = const Color(0xFFB5B5B5);
  static Color greyColor = const Color(0xFFB5B5B5);
  static Color fillColor = const Color(0xFFE9F3FD).withOpacity(0.3);
  static Color dividerColor = const Color(0xFF555555);
  static Color shadowColor = const Color(0xFF2B2A2A);
  static Color bottomBarColor = const Color(0xFF343434);


  // static BoxShadow shadow=BoxShadow(
  //   blurRadius: 4,
  //   spreadRadius: 0,
  //   color: shadowColor,
  //   offset: const Offset(0, 2),
  // );
}
class Appcolors {
  static const Color primary = Color(0xFFFFFFFF); // Neutral/White
  static const Color primaryInverted = Color(0xFF0A0A0A); // Neutral/950 (guess)
  static const Color page = Color(0xFFF9FAFB); // Neutral/25
  static const Color dashboardPage = Color(0xFFFFFFFF); // #FFFFFF
  static const Color dashboardPage2 = Color(0xFFFAFBFC); // #FAFBFC
  static const Color secondary = Color(0xFFF1F5F9); // Neutral/100 (guess)

  // Actions
  static const Color action = Color(0xFF2E8BC9); // Primary/500
  static const Color actionLight = Color(0xFFE3F2FD); // Primary/50 (guess)
  static const Color actionHover = Color(0xFF1565C0); // Primary/700
  static const Color actionHoverLight = Color(0xFFE3F2FD); // Primary/50 (again)

  // States
  static const Color disabled = Color(0xFFCBD5E1); // Neutral/300
  static const Color success = Color(0xFFE6F4EA); // Success/50 (guess)
  static const Color errorLight = Color(0xFFFDECEA); // Error/50 (guess)
  static const Color normalLight = Color(0xFFEFF6FF); // Peace/50 (guess)
  static const Color error = Color(0xFFEF4444); // Error/500
  static const Color warning = Color(0xFFFFF8E1);
}

class BorderColors {
  // Border Colors
  static const Color primary = Color(0xFF0A0A0A);        // Neutral/950
  static const Color secondary = Color(0xFFCBD5E1);      // Neutral/300
  static const Color tertiary = Color(0xFFE2E8F0);       // Neutral/200

  static const Color action = Color(0xFF2E8BC9);         // Primary/500
  static const Color actionHover = Color(0xFF1565C0);    // Primary/700
  static const Color focus = Color(0xFF90CAF9);          // Primary/300

  static const Color disabled = Color(0xFFCBD5E1);       // Neutral/300 again
  static const Color success = Color(0xFF388E3C);        // Success/700
  static const Color normal = Color(0xFF2563EB);         // Peace/700 (guessed)
  static const Color error = Color(0xFFD32F2F);          // Error/700
  static const Color warning = Color(0xFFFB8C00);        // Warning/600
}
class TextColors{
  // Neutral colors
  static const neutral900 = Color(0xFF212121);
  static const neutral500 = Color(0xFF9E9E9E);
  static const neutral300 = Color(0xFFE0E0E0);
  // Primary colors
  static const primary500 = Color(0xFF2196F3); // Example blue
  static const primary700 = Color(0xFF1976D2);

  // Status colors
  static const success700 = Color(0xFF388E3C);
  static const peace700 = Color(0xFF0288D1); // or any peace color you prefer
  static const error700 = Color(0xFFD32F2F);
  static const warning600 = Color(0xFFFB8C00);

  // Semantic colors
  static const primary = primary500;
  static const secondary = neutral500;
  static const action = primary500;
  static const actionHover = primary700;
  static const disabled = neutral300;
  static const onDisabled = neutral500;
  static const success = success700;
  static const normal = peace700;
  static const error = error700;
  static const warning = warning600;
}

