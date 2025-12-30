import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_test/view/login_Page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final RxBool _obscurePassword = true.obs;
  final RxBool _obscureConfirmPassword = true.obs;

  final _formKey = GlobalKey<FormState>();
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icons.headphones,
                    size: 48,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Track Test",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Signup",
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
                        // Name Field
                        _buildTextField(
                          hint: "User Name",
                          icon: Icons.account_circle_rounded,
                          controllerName: _userName,
                        ),

                        const SizedBox(height: 16),

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

                        const SizedBox(height: 16),

                        //Confirm Password Field
                        // _buildTextField(
                        //   hint: "Confirm Password",
                        //   icon: Icons.lock_outline,
                        //   controllerName: _password,
                        //   isPassword: true,
                        // ),
                        _buildTextField(
                          hint: "Confirm Password",
                          icon: Icons.lock_outline,
                          controllerName: _confirmPassword,
                          isPassword: true,
                          isConfirmPassword: true,
                        ),




                        const SizedBox(height: 30),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.snackbar(
                                  "Success",
                                  "User registered Successfully",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.white
                                );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder:(context)=>LoginPage())
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
                              "SignUp",
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
                              "Already have an account?",
                              style: TextStyle(color: Colors.white70),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder:(context)=>LoginPage())
                                );
                              },
                              child: const Text(
                                "Login",
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

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controllerName,
    bool isPassword = false,
    bool isConfirmPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: isPassword
          ? Obx(() => TextFormField(
        controller: controllerName,
        obscureText: isConfirmPassword
            ? _obscureConfirmPassword.value
            : _obscurePassword.value,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint is required';
          }
          if (isConfirmPassword && value != _password.text) {
            return 'Passwords do not match';
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
              (isConfirmPassword
                  ? _obscureConfirmPassword.value
                  : _obscurePassword.value)
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              if (isConfirmPassword) {
                _obscureConfirmPassword.value =
                !_obscureConfirmPassword.value;
              } else {
                _obscurePassword.value = !_obscurePassword.value;
              }
            },
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ))
          : TextFormField(
        controller: controllerName,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint is required';
          }
          if (hint == "Email" && !GetUtils.isEmail(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: Colors.white),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }


}
