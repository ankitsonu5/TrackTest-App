import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_test/view/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final RxBool _obscurePassword = true.obs;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff6A11CB),
              Color(0xff2575FC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                // App Logo
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    // color: Colors.white30,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Login to your account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 40),

                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        _buildTextField(
                          hint: "Email",
                          icon: Icons.email_outlined,
                          controllerName: _email,
                        ),

                        const SizedBox(height: 16),

                        // Password Field
                        _buildTextField(
                          hint: "Password",
                          icon: Icons.lock_outline,
                          controllerName: _password,
                          isPassword: true,
                        ),

                        const SizedBox(height: 12),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.snackbar(
                                  "Success",
                                  "Login Successful",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff2575FC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 5,
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don’t have an account?",
                              style: TextStyle(color: Colors.white70),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder:(context)=>SignUpPage())
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required String hint,
  //   required IconData icon,
  //   required TextEditingController controllerName,
  //   bool isPassword = false,
  // }) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(0.15),
  //       borderRadius: BorderRadius.circular(14),
  //     ),
  //     child: Obx(
  //         ()=> TextFormField(
  //           controller: controllerName,
  //           obscureText: isPassword ? _obscurePassword.value : false,
  //           style: const TextStyle(color: Colors.white),
  //
  //           validator: (value){
  //             if (value == null || value.isEmpty) {
  //               return '$hint is required';
  //             }
  //
  //             if (hint == "Email" && !GetUtils.isEmail(value)) {
  //               return 'Enter a valid email';
  //             }
  //
  //             if (isPassword && value.length < 6) {
  //               return 'Password must be at least 6 characters';
  //             }
  //
  //             return null;
  //
  //           },
  //
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             hintText: hint,
  //             hintStyle: const TextStyle(color: Colors.white70),
  //             prefixIcon: Icon(icon, color: Colors.white),
  //             suffixIcon: isPassword
  //                 ? IconButton(
  //               icon: Icon(
  //                 _obscurePassword.value
  //                     ? Icons.visibility_off
  //                     : Icons.visibility,
  //                 color: Colors.white,
  //               ),
  //               onPressed: () {
  //                 _obscurePassword.value = !_obscurePassword.value;
  //               },
  //             )
  //                 : null,
  //             contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //
  //           ),
  //         ),
  //     ),
  //   );
  //
  // }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controllerName,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),

      // 🔥 Obx ONLY for password
      child: isPassword
          ? Obx(() => TextFormField(
            controller: controllerName,
            obscureText: _obscurePassword.value,
            style: const TextStyle(color: Colors.white),

            validator: (value) {
              if (value == null || value.isEmpty) {
              return '$hint is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
              prefixIcon: Icon(icon, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword.value
                  ? Icons.visibility_off
                  : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () =>
                _obscurePassword.value = !_obscurePassword.value,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16
              ),
            ),
          ))
          : TextFormField(
            controller: controllerName,
            style: const TextStyle(color: Colors.white),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return '*   $hint is required';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Enter a valid email';
              }
              return null;
            },

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
              prefixIcon: Icon(icon, color: Colors.white),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16
              ),
            ),
          ),
    );
  }
}
