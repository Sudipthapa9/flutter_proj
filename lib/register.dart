import 'package:flutter/material.dart';

class RegistartionScreen extends StatelessWidget {
  const RegistartionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child:  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter yout name'
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email'
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to home page or perform registration logic
            },
            child: const Text('Register'),
          ),
        ],
      ),
     )
    
  
    
    ));  }
} 