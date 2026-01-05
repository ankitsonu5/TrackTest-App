// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:file_picker/file_picker.dart';
//
// class UploadSong2Controller extends GetxController {
//   // Text fields
//   final songTitle2 = ''.obs;
//   final description2 = ''.obs;
//   final genre2 = ''.obs;
//
//   // Audio file
//   Rx<PlatformFile?> selectedAudio2 = Rx<PlatformFile?>(null);
//
//   // Upload state
//   RxDouble uploadProgress = 0.0.obs;
//   RxBool isUploading = false.obs;
//
//   /// Pick audio
//   Future<void> pickAudio() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp3', 'wav', 'm4a'],
//     );
//
//     if (result != null) {
//       selectedAudio2.value = result.files.first;
//     }
//   }
//
//   /// Simulated upload
//   void uploadSong() {
//     if (selectedAudio2.value == null) {
//       Get.snackbar("Error", "Please select an audio file");
//       return;
//     }
//
//     isUploading.value = true;
//     uploadProgress.value = 0;
//
//     Timer.periodic(const Duration(milliseconds: 300), (timer) {
//       uploadProgress.value += 0.1;
//
//       if (uploadProgress.value >= 1) {
//         timer.cancel();
//         isUploading.value = false;
//         uploadProgress.value = 1;
//
//         Get.snackbar("Success", "Upload completed 🎉");
//       }
//     });
//   }
// }


import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadSong2Controller extends GetxController {
  Rx<PlatformFile?> selectedAudio2 = Rx<PlatformFile?>(null);

  RxString songTitle2 = ''.obs;
  RxString description2 = ''.obs;
  RxString genre2 = ''.obs;

  RxBool isUploading = false.obs;
  RxDouble uploadProgress = 0.0.obs;

  /// Pick audio
  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'm4a'],
    );

    if (result != null) {
      selectedAudio2.value = result.files.first;

      //  START UPLOAD AFTER SELECT
      uploadSong();
    }
  }

  void uploadSong() {
    isUploading.value = true;
    uploadProgress.value = 0;

    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      uploadProgress.value += 0.1;

      if (uploadProgress.value >= 1) {
        timer.cancel();
        isUploading.value = false;
        uploadProgress.value = 1;

        Get.snackbar("Success", "Song uploaded successfully 🎵");
      }
    });
  }

  bool validateFields() {
    if (selectedAudio2.value == null) {
      Get.snackbar("Error", "Please select an audio file");
      return false;
    }

    if (songTitle2.value.trim().isEmpty) {
      Get.snackbar("Error", "Song title is required");
      return false;
    }

    if (description2.value.trim().isEmpty) {
      Get.snackbar("Error", "Description is required");
      return false;
    }

    return true;
  }
}

