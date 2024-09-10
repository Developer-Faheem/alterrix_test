import 'package:alterrix/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search by name',
                  ),
                  onChanged: controller.search,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  void showConfirmationDialog() {
    Get.defaultDialog(
      title: 'Ready',
      content: Text('Do you want to proceed?'),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: Text('Proceed'),
          onPressed: () {
            Get.back();
            // Perform the action after confirmation
          },
        ),
      ],
    );
  }
}
