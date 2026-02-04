import 'package:flutter/material.dart';
import '../../../controllers/user_controller.dart';
import 'user_form.dart';
import 'user_table.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController controller = UserController();

  @override
  void initState() {
    super.initState();
    controller.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD User')),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              UserForm(controller: controller),
              Expanded(
                child: UserTable(
                  users: controller.users,
                  controller: controller,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
