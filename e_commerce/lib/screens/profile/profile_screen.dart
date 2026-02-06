import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';
import '../../common/widgets/profile_menu_item.dart';
import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAccountSetting(),
                    const SizedBox(height: 24),
                    _buildAppSettingLabel(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ===== Header xanh =====
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      color: AppColors.primaryBlue,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nguyen Van A',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'nguyenvana@gmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.updateAccount);
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// ===== Account Setting =====
  Widget _buildAccountSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account Setting', style: AppTextStyle.title),
        const SizedBox(height: 16),

        ProfileMenuItem(
          icon: Icons.location_on,
          title: 'My Address',
          subtitle: 'Manage your shipping address',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.shopping_cart,
          title: 'My Cart',
          subtitle: 'View items in your cart',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.receipt_long,
          title: 'My Order',
          subtitle: 'Track your orders',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.account_balance,
          title: 'Bank Account',
          subtitle: 'Manage payment methods',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.discount,
          title: 'My Coupon',
          subtitle: 'View available coupons',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.notifications,
          title: 'Notification',
          subtitle: 'Notification preferences',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Icons.lock,
          title: 'Account Privacy',
          subtitle: 'Security and privacy settings',
          onTap: () {},
        ),
      ],
    );
  }

  /// ===== App Setting label =====
  Widget _buildAppSettingLabel() {
    return Text('App Setting', style: AppTextStyle.title);
  }
}
