import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/user_model.dart';
import '../../../utils/api.dart';

class UserController extends GetxController {
  var tagList = <DataUser>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/user';
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }


  @override
  void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var user = User.fromJson(jsonResponse);
        tagList.value = user.data!;
      } else {
        Get.snackbar('Error', 'Failed to fetch users');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users : $e');
    } finally {
      isLoading(false);
    }
  }

  // add kategori
  Future<void> addUser(DataUser newUser) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newUser.toJson()),
      );
      if (response.statusCode == 201) {
        fetchUsers();
        Get.back();
        Get.snackbar("Success", "User added succesfully");
      } else {
        Get.snackbar('Error', 'Failed to add user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add user : $e');
    } finally {
      isLoading(false);
    }
  }

  // update kategori
  Future<void> updateUser(int id, DataUser updateUser) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updateUser.toJson()),
      );
      if (response.statusCode == 200) {
        fetchUsers();
        Get.back();
        Get.snackbar("Success", "User updated succesfully");
      } else {
        Get.snackbar('Error', 'Failed to update user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update user : $e');
    } finally {
      isLoading(false);
    }
  }

  // delete kategori
  Future<void> deleteUser(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
      );
      if (response.statusCode == 200) {
        fetchUsers();
        Get.snackbar("Success", "User deleted succesfully");
      } else {
        Get.snackbar('Error', 'Failed to delete user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete user : $e');
    } finally {
      isLoading(false);
    }
  }

}