import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/shared_prefs.dart';
import 'login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  void logout(BuildContext context) async {

    await SharedPrefsHelper.setBoolValue(
      AppConstants.keyIsLoggedIn,
      false,
    );

    await SharedPrefsHelper.setStringValue(
      AppConstants.keyUsername,
      "",
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
