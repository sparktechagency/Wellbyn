import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../base/Apptext/app_text.dart';
class MedicalInfoHeader extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;

  const MedicalInfoHeader({
    Key? key,
    required this.title,
    required this.description,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 5),
            AppText(
              title,
              fontSize: 18,
              color: TextColors.neutral900,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w500,
            color: TextColors.neutral500,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
