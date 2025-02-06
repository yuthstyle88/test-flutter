import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/registration_form_data.dart';
import '../ui/success_screen.dart';

class RegistrationController extends GetxController {
  final RegistrationFormData _formData = RegistrationFormData();

  RegistrationFormData get formData => _formData;

  void submitForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      print('Name: ${_formData.nameController.text}');
      print('Email: ${_formData.emailController.text}');
      print('Phone: ${_formData.phoneController.text}');
      print('Password: ${_formData.passwordController.text}');
      print('Confirm Password: ${_formData.confirmPasswordController.text}');
      
      Get.to(() => SuccessScreen());
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields correctly',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
