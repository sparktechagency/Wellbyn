import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';


class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final List<String> stepLabels;

  const StepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    required this.stepLabels,
  })  : assert(totalSteps > 0),
        assert(currentStep > 0 && currentStep <= totalSteps),
        assert(stepLabels.length == totalSteps),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Steps and lines row
        Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            if (index.isEven) {
              final stepIndex = index ~/ 2 + 1;
              return _buildStep(
                isActive: stepIndex == currentStep,
                step: stepIndex.toString(),
              );
            } else {
              return _buildLine();
            }
          }),
        ),
        SizedBox(height: 8.h),
        // Labels row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: stepLabels
              .map(
                (label) => Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: TextColors.neutral500,
                fontFamily: "Satoshi",
              ),
            ),
          )
              .toList(),
        )
      ],
    );
  }

  Widget _buildStep({required bool isActive, required String step}) {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: isActive ? Appcolors.action : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Appcolors.action :  TextColors.neutral300,
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        step,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: isActive ? Colors.white :  TextColors.neutral900,
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 1.h,
        color:  TextColors.neutral300,
      ),
    );
  }
}
