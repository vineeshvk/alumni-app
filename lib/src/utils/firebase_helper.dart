import 'dart:io';

import 'package:alumni_app/src/models/user.dart';
import 'package:alumni_app/src/utils/preference_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  static final StorageReference storage = FirebaseStorage(
    storageBucket: 'gs://alumniii.appspot.com',
  ).ref();

  static Future<String> uploadImage(File file) async {
    String url;
    User user = await PreferenceHelper.getToken();
    String fileName = DateTime.now().toIso8601String();

    final imageRef = storage.child("images/${user.id + "_feed_" + fileName}");
    final uploadTask = imageRef.putFile(file);

    final downloadURL = await uploadTask.onComplete;
    url = await downloadURL.ref.getDownloadURL();

    return url;
  }
}
