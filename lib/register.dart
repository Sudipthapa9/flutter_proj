import 'package:flutter/material.dart';
import 'package:flutter_proj/register_controller.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final UserController usercontroller = Get.put(UserController());

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final avatarCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    avatarCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: avatarCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Enter avatar URL',
                  ),
                ),
                const SizedBox(height: 20),

                Obx(() {
                  return ElevatedButton(
                    onPressed: usercontroller.isLoading.value
                        ? null
                        : () {
                            usercontroller.createUser(
                              name: nameCtrl.text.trim(),
                              email: emailCtrl.text.trim(),
                              password: passwordCtrl.text,
                              avatarUrl: avatarCtrl.text.trim(),
                            );
                          },
                    child: usercontroller.isLoading.value
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Register"),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
