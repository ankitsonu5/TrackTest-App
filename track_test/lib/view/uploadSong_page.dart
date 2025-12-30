import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:track_test/view/upload_song_page2.dart';

import '../controller/upload_songs_controller.dart';

class UploadSong extends StatelessWidget {
  UploadSong({super.key});

  final UploadSongsController controller = Get.put(UploadSongsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload First Song"),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Obx(() {
                      final audio = controller.selectedAudio.value;
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
              onChanged: (v) => controller.songTitle.value = v,
              decoration: const InputDecoration(
                labelText: "Song Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            /// Description
            TextField(
              onChanged: (v) => controller.description.value = v,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            /// Genre
            TextField(
              onChanged: (v) => controller.genre.value = v,
              decoration: const InputDecoration(
                labelText: "Genre",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            /// Upload button
            // Obx(() =>
                ElevatedButton(
              // onPressed: controller.isUploading.value
              //     ? null
              //     : controller.uploadSong,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadSongs2())
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text( "Next", style: TextStyle(fontWeight: FontWeight.w900,),
                // controller.isUploading.value
                //     ? "Uploading..."
                //     : "Upload",
              ),
            // )
            ),
          ],
        ),
      ),
    );
  }
}
