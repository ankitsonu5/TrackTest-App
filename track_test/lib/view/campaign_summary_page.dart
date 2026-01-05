import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_test/view/dashboard_page.dart';
import '../controller/testing_parameters_controller.dart';

class CampaignLaunchedPage
    extends GetView<TestingParametersController> {
  const CampaignLaunchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// ✅ Success Icon
                Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Icon(Icons.check, size: 32,color:Colors.green ,),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Your song testing campaign\nhas been launched!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 24),

                /// Campaign Summary
                const Text(
                  "Campaign Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                _infoBox(() => "Target Audience: ${controller.targetAudience.value}"),
                _infoBox(() => "Age Group: ${controller.ageGroup.value}"),
                _infoBox(() => "Gender: ${controller.gender.value}"),
                _infoBox(() => "Genre: ${controller.genre.value}"),

                Row(
                  children: [
                    Expanded(
                      child: _infoBox(
                            () => "${controller.listenerCount.value} Listeners",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _infoBox(
                            () => controller.deadline.value == null
                            ? "No Deadline"
                            : "Deadline: ${controller.deadline.value!.day}/"
                            "${controller.deadline.value!.month}/"
                            "${controller.deadline.value!.year}",
                      ),
                    ),
                  ],
                ),

                _infoBox(() => "Reward Type: ${controller.rewardType.value}"),

                const SizedBox(height: 16),

                /// Track Progress (static for now)
                const Text(
                  "Track Progress",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                _infoBox(() => "Listener Count  0/${controller.listenerCount.value} Reviewed"),
                // _infoBox(() => "Rating Average  --"),
                // _infoBox(() => "Feedback Count  0"),

                const SizedBox(height: 20),

                /// Buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffc74a0f),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.snackbar(
                      "Dashboard",
                      " Work is under progress"
                    );
                  },
                  child: const Text(
                    "View Insights Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 12),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffc74a0f),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(DashboardPage());
                  },
                  child: const Text(
                    "Go to Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reactive info box
  Widget _infoBox(String Function() text) {
    return Obx(
          () => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(text(), style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
