import 'dart:convert';
import 'package:alterrix/models/users_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var users = <User>[].obs;
  var searchQuery = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true; // Start loading

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        users.value = data.map((item) => User.fromJson(item)).toList();

        Get.snackbar(
          'Congratulations',
          'Data fetched successfully!',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch data!',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  List<User> get filteredUsers {
    if (searchQuery.value.isEmpty) {
      return users;
    } else {
      return users
          .where((user) =>
              user.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void search(String query) {
    searchQuery.value = query; // Update search query
  }
}
