import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading(true);
    final url = Uri.parse('${BaseUrl.api}/register');
    final response = await http.post(
      url,
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Registration successfull',
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Error', 'Registration Failed. Please Try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}