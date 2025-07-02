import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;
  final double titleFontSize;
  final double valueFontSize;

  const InfoItem({
    Key? key,
    required this.title,
    required this.value,
    this.titleColor = const Color(0xFF9E9E9E), // default neutral500
    this.valueColor = const Color(0xFF212121), // default neutral900
    this.titleFontSize = 14,
    this.valueFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "Satoshi",
            color: titleColor,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          value,
          style: TextStyle(
            fontFamily: "Satoshi",
            color: valueColor,
            fontSize: valueFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
