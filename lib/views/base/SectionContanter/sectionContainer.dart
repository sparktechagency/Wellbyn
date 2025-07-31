import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  const SectionContainer({
    Key? key,
    required this.children,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white, // or Appcolors.primary
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // or Appcolors.secondary
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
