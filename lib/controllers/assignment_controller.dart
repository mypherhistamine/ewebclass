import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentController extends GetxController {
  Future<void> submitWork({BuildContext context, String fileName}) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ['pdf'],
        // allowMultiple: false,
        // type: FileType.any,
        );

    if (result != null) {
      print(result.files.single.path);
      File file = File(result.files.single.path);
      await uploadFile(result.files.single.path, fileName);
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/')
          .child(fileName)
          .putFile(file);
    } catch (err) {
      print(err);
      // e.g, e.code == 'canceled'
    }
  }
}
