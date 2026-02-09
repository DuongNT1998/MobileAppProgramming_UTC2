import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';

import '../../common/styles/app_text_styles.dart';
import '../../routes/app_routes.dart';

class UpdateAccountScreen extends StatelessWidget {
  const UpdateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Account'),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAvatarSection(),
            _divider(),
            _buildProfileInformation(context),
            _divider(),
            _buildPersonalInformation(context),
            _divider(),
            _buildCloseAccount(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: const Text('Change Profile Picture'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInformation(BuildContext context) {
    return _section(
      title: 'Profile Information',
      children: [
        _item(
          label: 'Name',
          value: 'Nguyen Van A',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.changeName);
          },
        ),
        _item(
          label: 'Username',
          value: 'nguyenvana',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.changeUsername);
          },
        ),
        _item(
          label: 'Password',
          value: '********',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.changePassword);
          },
        ),
      ],
    );
  }

  Widget _buildPersonalInformation(BuildContext context) {
    return _section(
      title: 'Personal Information',
      children: [
        _item(
          label: 'User ID',
          value: 'USR123456',
          trailing: Icons.copy,
          onTap: () {
            // copy logic
          },
        ),
        _item(
          label: 'Email',
          value: 'nguyenvana@gmail.com',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.changeEmail,
              arguments: 'Email',
            );
          },
        ),
        _item(
          label: 'Phone Number',
          value: '0123456789',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.changePhoneNumber,
              arguments: 'Phone Number',
            );
          },
        ),
        _item(
          label: 'Gender',
          value: 'Male',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.changeGender,
              arguments: 'Gender',
            );
          },
        ),
        _item(
          label: 'Date of Birth',
          value: '01/01/2000',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.changeDateofBirth,
              arguments: 'Date of Birth',
            );
          },
        ),
      ],
    );
  }

  Widget _buildCloseAccount() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {},
        child: const Text('Close account', style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _section({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.title),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _item({
    required String label,
    required String value,
    IconData trailing = Icons.arrow_forward_ios,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(value),
      trailing: Icon(trailing, size: 18),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return const Divider(thickness: 1);
  }
}
