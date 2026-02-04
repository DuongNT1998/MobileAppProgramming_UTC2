import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import '../utils/constants.dart';
import '../widgets/custom_button.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {

  TextEditingController usernameController = TextEditingController();

  void login() async {

    String username = usernameController.text;

    if (username.isEmpty) {
      return;
    }

    await SharedPrefsHelper.setBoolValue(
      AppConstants.keyIsLoggedIn,
      true,
    );

    await SharedPrefsHelper.setStringValue(
      AppConstants.keyUsername,
      username,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: "Login",
              onPressed: login,
            ),
          ],
        ),
      ),
    );
  }
}
