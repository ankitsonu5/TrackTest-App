import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/testing_parameters_controller.dart';


class SetTestingParametersPage extends StatelessWidget {
  SetTestingParametersPage({super.key});

  final TestingParametersController controller = Get.put(TestingParametersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Testing Parameters"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffe7dbf4),
              Color(0xffddbfb1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _label("Target Audience"),
              _dropdown(
                value: controller.targetAudience,
                items: ["India", "USA", "UK", "Global"],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Age"),
                        _dropdown(
                          value: controller.ageGroup,
                          items: ["18-24", "18-34", "25-40", "40+"],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Gender"),
                        _dropdown(
                          value: controller.gender,
                          items: ["All", "Male", "Female"],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              _label("Genre / Mood (optional)"),
              _dropdown(
                value: controller.genre,
                items: ["Select", "Pop", "Hip-Hop", "Rock", "EDM"],
              ),

              const SizedBox(height: 16),

              _label("Number of Listeners"),
              _dropdown(
                value: controller.listenerCount,
                items: ["50", "100", "250", "500"],
              ),

              const SizedBox(height: 16),

              _label("Deadline"),
              Obx(() => GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                    initialDate: DateTime.now(),
                  );
                  if (picked != null) {
                    controller.deadline.value = picked;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    controller.deadline.value == null
                        ? "Select Date"
                        : "${controller.deadline.value!.month}/"
                        "${controller.deadline.value!.day}/"
                        "${controller.deadline.value!.year}",
                  ),
                ),
              )),

              const SizedBox(height: 20),

              _label("Reward Type"),
              _radio("None"),
              _radio("Cash Reward"),
              _radio("Points"),
              _radio("Badge Access"),

              const SizedBox(height: 12),

              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Enable Comments?",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: controller.enableComments.value,
                    onChanged: (v) =>
                    controller.enableComments.value = v,
                  ),
                ],
              )),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.launchCampaign,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Launch Campaign",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Reusable Widgets ----------

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _dropdown({
    required RxString value,
    required List<String> items,
  }) {
    return Obx(() => DropdownButtonFormField<String>(
      value: value.value,
      items: items
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
          .toList(),
      onChanged: (v) => value.value = v!,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
      ),
    ));
  }

  Widget _radio(String value) {
    return Obx(() => RadioListTile(
      value: value,
      groupValue: controller.rewardType.value,
      onChanged: (v) => controller.rewardType.value = v!,
      title: Text(value),
      dense: true,
    ));
  }
}
