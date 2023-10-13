import 'package:buy_sell_app/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
