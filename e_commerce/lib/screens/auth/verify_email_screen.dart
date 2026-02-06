import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;

  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              Image.asset(
                'assets/images/animations/sammy-line-man-receives-a-mail.png',
                height: 200,
              ),

              const SizedBox(height: 32),

              const Text(
                'Verify your email address',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const Text(
                'We have sent a verification link to:',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(email, style: const TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 32),

              PrimaryButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.registerSuccess);
                },
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  // TODO: resend verify email
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verification email resent')),
                  );
                },
                child: const Text('Resend email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
