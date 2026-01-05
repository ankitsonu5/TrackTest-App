import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:track_test/controller/upload_song2_controller.dart';
import 'package:track_test/view/set_testing_parameters_page.dart';


class UploadSongs2 extends StatelessWidget {
  UploadSongs2({super.key});

  final UploadSong2Controller controller = Get.put(UploadSong2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xffcf6d3f),

        title: const Text("Upload second Song"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       // Color(0xff6A11CB),
          //       // Color(0xff2575FC),
          //       Color(0xffc74a0f),
          //       Color(0xffecccbd),
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              /// Audio picker box
              GestureDetector(
                onTap: controller.pickAudio,
                child: DottedBorder(
                  dashPattern: const [8, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade100,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffc74a0f),
                          Color(0xffecccbd),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Obx(() {
                        final audio = controller.selectedAudio2.value;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.audiotrack, size: 40),
                            const SizedBox(height: 8),
                            Text(
                              audio == null
                                  ? "Tap to select audio file"
                                  : audio.name,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Upload progress
              Obx(() => controller.isUploading.value
                  ? Column(
                children: [
                  LinearProgressIndicator(
                    value: controller.uploadProgress.value,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${(controller.uploadProgress.value * 100).toInt()}%",
                  ),
                ],
              )
                  : const SizedBox()),

              const SizedBox(height: 20),

              /// Song title
              TextField(
                onChanged: (v) => controller.songTitle2.value = v,
                decoration: const InputDecoration(
                  labelText: "Song Title",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              /// Description
              TextField(
                onChanged: (v) => controller.description2.value = v,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              /// Genre
              TextField(
                onChanged: (v) => controller.genre2.value = v,
                decoration: const InputDecoration(
                  labelText: "Genre",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              /// Upload button
              // Obx(() =>
                  ElevatedButton(
                onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>SetTestingParametersPage())
                  );
                },

                  // controller.isUploading.value
                  //     ? null
                  //   : controller.uploadSong,
                  //
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                    // backgroundColor: Colors.black,
                    backgroundColor: Color(0xffc74a0f),

                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                ),
                child: Text(
                  // controller.isUploading.value
                  //     ? "Uploading..."
                  //     :
                  "Upload",
                ),
              // )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
