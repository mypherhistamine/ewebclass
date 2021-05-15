import 'dart:io';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:path_provider/path_provider.dart';

class FileDownloadController extends GetxController {
  var fileIsDownload = false.obs;

  Future<void> downloadFile() async {
    fileIsDownload.value = true;
    await Future.delayed(Duration(seconds: 5));
    fileIsDownload.value = false;
  }

  Future<void> handleTaskExample2(String filePath) async {
    File largeFile = File(filePath);

    firebase_storage.UploadTask task = firebase_storage.FirebaseStorage.instance
        .ref('uploads/hello-world.txt')
        .putFile(largeFile);

    task.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
      print('Task state: ${snapshot.state}');
      print(
          'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
    }, onError: (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
      print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    });

    // We can still optionally use the Future alongside the stream.
    try {
      await task;
      print('Upload complete.');
    } on firebase_core.FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
      // ...
    }
  }

  Future<void> downloadFileExample({
    String fileName,
    String cloudStorageLocation,
  }) async {
    List<Directory> appDocDir = await getExternalStorageDirectories();
    String path = "/storage/emulated/0/Download";

    print(appDocDir);
    // File downloadToFile = File('${appDocDir[1].path}/hta.txt');
    File downloadToFile = File('$path/$cloudStorageLocation');

    print("directory at: $downloadToFile");

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('eweb')
          .child('$cloudStorageLocation')
          .writeToFile(downloadToFile);
      print("file downlodaed");
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      if (e.code == 'caceled') {
        print("canceled");
      }
    }
  }
}
