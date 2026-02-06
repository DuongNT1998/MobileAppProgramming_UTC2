import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/animations/sammy-line-success.png',
                height: 200,
              ),

              const SizedBox(height: 32),

              const Text(
                'Your account successfully created',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const Text(
                'Welcome! Your account is ready to use.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              PrimaryButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
