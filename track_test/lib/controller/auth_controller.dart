// import 'package:get/get.dart';
// import '../db/user_repository.dart';
// import '../model/user_model.dart';
//
// class UserController extends GetxController {
//   final UserRepository repo = UserRepository();
//
//   var users = <UserModel>[].obs;
//
//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }
//
//   void fetchUsers() async {
//     users.value = await repo.getUsers();
//   }
//
//   void addUser(String name, String email) async {
//     await repo.insertUser(UserModel(name: name, email: email));
//     fetchUsers();
//   }
//
//   void deleteUser(int id) async {
//     await repo.deleteUser(id);
//     fetchUsers();
//   }
// }


import 'package:get/get.dart';
import '../db/user_repository.dart';
import '../model/user_model.dart';
import '../view/dashboard_page.dart';

class LoginController extends GetxController {
  final UserRepository repo = UserRepository();

  Future<void> login(String email, String password) async {
    final UserModel? user = await repo.login(email, password);

    if (user != null) {
      Get.offAll(() => DashboardPage());
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
