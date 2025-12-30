// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:track_test/view/uploadSong_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcf6d3f),
        title: const Text(
          'TrackTest',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => UploadSong())
                );
              },
              icon: const Icon(Icons.upload, size: 18),
              label: const Text("Upload Song"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color(0xff6A11CB),
              // Color(0xff2575FC),
              Color(0xffc74a0f),
              Color(0xffecccbd),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dashboardButton(
              context,
              title: "Tests in Progress",
              icon: Icons.play_circle_fill,
              onTap: () {
                // TODO: Navigate to Tests in Progress
              },
            ),
            const SizedBox(height: 20),

            _dashboardButton(
              context,
              title: "Awaiting Feedback",
              icon: Icons.hourglass_bottom,
              onTap: () {
                // TODO: Navigate to Awaiting Feedback
              },
            ),
            const SizedBox(height: 20),

            _dashboardButton(
              context,
              title: "Insights",
              icon: Icons.analytics,
              onTap: () {
                // TODO: Navigate to Insights
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
