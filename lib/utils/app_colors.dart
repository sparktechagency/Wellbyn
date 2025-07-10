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
  static const Color primary50 = Color(0xFFF2F8FD); // Neutral/White
  static const Color primaryInverted = Color(0xFF292929); // Neutral/950 (guess)
  static const Color page = Color(0xFFF5F7F9); // Neutral/25
  static const Color dashboardPage = Color(0xFFFFFFFF); // #FFFFFF
  static const Color dashboardPage2 = Color(0xFFFAFBFC); // #FAFBFC
  static const Color secondary = Color(0xFFF3F3F3); // Neutral/100 (guess)
  static const Color background = Color(0xFFE6E6E6); // Neutral/100 (guess)
  static const Color brand222 = Color(0xFF1E1E1E); // Neutral/100 (guess)
  static const Color primary100 = Color(0xFFE4EFFA);
  // Actions
  static const Color action = Color(0xFF2E8BC9); // Primary/500
  static const Color primary700 = Color(0xFF2E8BC9); // Primary/500
  static const Color actionLight = Color(0xFFF2F8FD); // Primary/50 (guess)
  static const Color actionHover = Color(0xFF1A588A); // Primary/700
  static const Color actionHoverLight = Color(0xFFF2F8FD); // Primary/50 (again)
  static const Color actionPrimary100 = Color(0xFFE4EFFA); // Primary/50 (again)

  // States
  static const Color disabled = Color(0xFFBDBDBD); // Neutral/300
  static const Color success = Color(0xFFEEFEE7); // Success/50 (guess)
  static const Color errorLight = Color(0xFFFEF2F2); // Error/50 (guess)
  static const Color normalLight = Color(0xFFF0F5FE); // Peace/50 (guess)
  static const Color error = Color(0xFFE94A4A); // Error/500
  static const Color error700 = Color(0xFFB42121); // Error/500
  static const Color error50 = Color(0xFFFEF2F2); // Error/500
  static const Color warning = Color(0xFFFBF7EB);
  static const Color success50 = Color(0xFFEEFEE7);
  static const Color natral25 = Color(0xFFF5F7F9);
}

class BorderColors {
  // Border Colors
  static const Color primary = Color(0xFFFFFFFF);        // Neutral/950
  static const Color secondary = Color(0xFFDCDCDC);      // Neutral/300
  static const Color tertiary = Color(0xFFE2E8F0);       // Neutral/200
  static const Color error700 = Color(0xFFB42121);       // Neutral/200

  static const Color action = Color(0xFF2E8BC9);         // Primary/500
  static const Color actionHover = Color(0xFF1565C0);    // Primary/700
  static const Color focus = Color(0xFF90CAF9);          // Primary/300
  static const Color primary100 = Color(0xFFE4EFFA);           // Primary/300

  static const Color disabled = Color(0xFFCBD5E1);       // Neutral/300 again
  static const Color success = Color(0xFF388E3C);        // Success/700
  static const Color normal = Color(0xFF2563EB);         // Peace/700 (guessed)
  static const Color error = Color(0xFFD32F2F);          // Error/700
  static const Color warning = Color(0xFFFB8C00);        // Warning/600
  static const Color warning50 = Color(0xFFFBF7EB);        // Warning/600
  static const Color warning700 = Color(0xFF93531F);        // Warning/600
}
class TextColors{
  // Neutral colors
  static const neutral900 = Color(0xFF3D3D3D);
  static const neutral500 = Color(0xFF7C7C7C);
  static const neutral300 = Color(0xFFBDBDBD);
  static const neutral100 = Color(0xFFF3F3F3);
  static const neutral200 = Color(0xFFDCDCDC);

  // Primary colors
  static const primary500 = Color(0xFF2E8BC9); // Example blue
  static const primary700 = Color(0xFF1A588A);



  // Status colors
  static const success700 = Color(0xFF388E3C);
  static const peace700 = Color(0xFF0288D1); // or any peace color you prefer
  static const error700 = Color(0xFF2B4DCA);
  static const warning600 = Color(0xFF93531F);

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

class ShadowColor{
  static const shadowcolor= Color(0xFFE4EFFA);
}
