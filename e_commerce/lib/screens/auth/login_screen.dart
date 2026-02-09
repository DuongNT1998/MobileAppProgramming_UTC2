import 'package:flutter/material.dart';

import '../../common/widgets/primary_button.dart';
import '../../common/widgets/social_login_button.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';
import '../../utils/preferences_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadRememberMe();
  }

  Future<void> _loadRememberMe() async {
    final bool savedRememberMe = await PreferencesHelper.getRememberMe();
    final String? savedEmail = await PreferencesHelper.getSavedEmail();

    setState(() {
      rememberMe = savedRememberMe;
      if (savedEmail != null) {
        emailController.text = savedEmail;
      }
    });
  }

  void _handleLogin() async {
    final bool isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    await PreferencesHelper.saveRememberMe(rememberMe, emailController.text);

    // ===== LOGIN TẠM THỜI – CHƯA GẮN BACKEND =====
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 32),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return Validators.validateEmail(value ?? '');
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: passwordController,
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    return Validators.validatePassword(value ?? '');
                  },
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword);
                      },
                      child: const Text('Forgot password?'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                PrimaryButton(title: 'Sign In', onPressed: _handleLogin),
                const SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Center(child: Text('OR')),

                const SizedBox(height: 16),

                SocialLoginButton(
                  icon: Icons.facebook,
                  title: 'Sign in with Facebook',
                  onPressed: () {},
                ),

                const SizedBox(height: 12),

                SocialLoginButton(
                  icon: Icons.g_mobiledata,
                  title: 'Sign in with Google',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
