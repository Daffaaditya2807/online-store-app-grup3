import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_app_final_project/model/profile.dart';

class ProfileController extends GetxController {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  void fetchProfileByUid(String uid) {
    _dbRef
        .child('user')
        .orderByChild('uid')
        .equalTo(uid)
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          profile.value =
              ProfileModel.fromJson(Map<String, dynamic>.from(value));
        });
      } else {
        profile.value = null;
      }
    }).onError((error) {
      print("Error fetching data: $error");
    });
  }

  void updateProfileByUid(String uid, String newName, String newPhone,
      String newEmail, BuildContext context, Function navigateCallback) {
    _dbRef
        .child('user')
        .orderByChild('uid')
        .equalTo(uid)
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          // Update each user with the new values
          _dbRef.child('user').child(key).update({
            'nama': newName,
            'phone': newPhone,
            'email': newEmail
          }).then((_) {
            print("Data updated successfully.");
            navigateCallback();
          }).catchError((error) {
            print("Failed to update data: $error");
          });
        });
      }
    }).catchError((error) {
      print("Error fetching data for update: $error");
    });
  }
}
