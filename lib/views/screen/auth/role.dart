import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controllers/role_controller.dart';
import '../../../utils/app_colors.dart';
import '../../base/AppButton/app_button.dart';
import 'create_acount_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final RoleController roleController = Get.put(RoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 150.w,
                height: 150.h,
                color: TextColors.action,
                // change color dynamically
                semanticsLabel: 'App Logo',
                // for accessibility
                fit: BoxFit.contain,
                // control how the image fits
                alignment: Alignment.center, // position the image
              ),
              const SizedBox(height: 40),
              Text(
                "Welcome to Wellbyn",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Satoshi',
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose your role",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Satoshi',
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Obx(
                () => Row(
                  children: [
                    _buildRoleButton("Patients"),
                    const SizedBox(width: 12),
                    _buildRoleButton("Doctor"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              AppButton(
                text: "Next",
                onPressed: () async {
                  if (roleController.isLoading.value)
                    return; // prevent double clicks
                  roleController.isLoading.value = true;
                  Get.to(
                    () => CreateAccountPage(
                      role: roleController.selectedRole.value,
                    ), // speed it up
                  );
                  roleController.isLoading.value = false;
                },
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  print('Log In tapped');
                  // Navigate to Login page if exists: Get.to(() => LoginPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: TextColors.neutral500,
                        fontFamily: 'Satoshi',
                        fontSize: 16,
                      ), // optional base style
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role) {
    final isSelected = roleController.selectedRole.value == role;
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: isSelected ? HexColor("#f2f8fd") : Colors.white,
          side: BorderSide(
            color: isSelected ? HexColor("#2E8BC9") : Colors.grey,
          ),
        ),
        onPressed: () => roleController.selectRole(role),
        child: Text(
          role,
          style: TextStyle(
            fontFamily: 'Satoshi',
            color: isSelected ? HexColor("#2E8BC9") : Colors.grey,
          ),
        ),
      ),
    );
  }
}
