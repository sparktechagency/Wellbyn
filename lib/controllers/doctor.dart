import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetX Controller for loading state
class DoctorController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctorData();
  }

  Future<void> loadDoctorData() async {
    try {
      isLoading(true);

      // Simulate API call or data loading
      await Future.delayed(const Duration(seconds: 1));

      // Your actual API calls would go here
      // await fetchDoctors();
      // await fetchFavorites();

    } catch (e) {
      // Handle error
      print('Error loading doctor data: $e');
    } finally {
      isLoading(false);
    }
  }

  void refreshData() {
    loadDoctorData();
  }
}