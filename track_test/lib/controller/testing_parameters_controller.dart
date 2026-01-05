import 'package:get/get.dart';

import '../view/campaign_summary_page.dart';

class TestingParametersController extends GetxController {
  // Dropdown values
  RxString targetAudience = "India".obs;
  RxString ageGroup = "18-34".obs;
  RxString gender = "All".obs;
  RxString genre = "Select".obs;
  // RxString listeners = "100".obs;
  RxString listenerCount = "100".obs;

  // Date
  Rx<DateTime?> deadline = Rx<DateTime?>(null);

  // Reward & comments
  RxString rewardType = "Points".obs;
  RxBool enableComments = true.obs;

  void launchCampaign() {
    // You can send this data to backend later
    Get.snackbar(
      "Campaign Launched",
      "Your testing campaign has been started 🚀",
    );
  }
}
