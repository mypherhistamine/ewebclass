import 'package:get/get.dart';

class FileDownloadController extends GetxController {
  var fileIsDownload = false.obs;

  Future<void> downloadFile() async {
    fileIsDownload.value = true;
    await Future.delayed(Duration(seconds: 5));
    fileIsDownload.value = false;

  }
}
