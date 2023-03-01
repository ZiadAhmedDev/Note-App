import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(title, message, duration) {
  Get.snackbar(
    title,
    message,
    duration: duration,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.grey[800],
    colorText: Colors.white,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(20),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOut,
  );
}
