import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import 'widgets/custom_text_field.dart';
import '../services/validation_service.dart';

class RegistrationForm extends StatelessWidget {
  final RegistrationController _controller = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                controller: _controller.formData.nameController,
                label: 'Name',
                validator: ValidationService.validateName,
              ),
              CustomTextField(
                controller: _controller.formData.emailController,
                label: 'Email',
                validator: ValidationService.validateEmail,
              ),
              CustomTextField(
                controller: _controller.formData.phoneController,
                label: 'Phone Number',
                validator: ValidationService.validatePhone,
              ),
              CustomTextField(
                controller: _controller.formData.passwordController,
                label: 'Password',
                obscureText: true,
                validator: ValidationService.validatePassword,
              ),
              CustomTextField(
                controller: _controller.formData.confirmPasswordController,
                label: 'Confirm Password',
                obscureText: true,
                validator: (value) => ValidationService.validateConfirmPassword(value, _controller.formData.passwordController.text),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _controller.submitForm(_formKey),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
