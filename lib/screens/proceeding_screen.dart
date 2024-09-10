import 'package:alterrix/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProceddingScreen extends StatelessWidget {
  const ProceddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => showConfirmationDialog(),
            child: Text("Start the application")),
      ),
    );
  }

  void showConfirmationDialog() {
    Get.defaultDialog(
      title: 'Confirm',
      content: Text('Do you want to proceed?'),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: Text('Proceed'),
          onPressed: () {
            Get.to(HomeScreen());
          },
        ),
      ],
    );
  }
}
