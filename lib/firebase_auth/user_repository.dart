import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/contacts/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .then(
          (value) => Get.snackbar(
        "Success",
        "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        //backgroundColor: Colors.green.withOpacity(0.1),
        // colorText: Colors.green,
      ),
    )
        .catchError(
          (error, stackTrace) {
        Get.snackbar(
          "Error",
          "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          //backgroundColor: Colors.redAccent.withOpacity(0.1),
          //colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs
        .map((e) => UserModel.fromSnapshot(e))
        .toList();

    return userData;
  }
}
