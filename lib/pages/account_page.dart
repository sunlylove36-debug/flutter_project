import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              _buildCustomAppBar(context),
              // Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Overview',
                          style: AppFonts.pageTitle.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Manage your account information and settings',
                          style: AppFonts.bodyText.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // Account Balance Card
                        _buildBalanceCard(),
                        const SizedBox(height: 20),
                        
                        // Account Details
                        _buildAccountDetails(),
                        const SizedBox(height: 20),
                        
                        // Quick Actions
                        _buildQuickActions(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Account',
            style: AppFonts.appBarTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.secondaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Balance',
            style: AppFonts.labelMedium.copyWith(
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$2,459.50',
            style: AppFonts.headline3.copyWith(
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: AppColors.accentGreen,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '+5.2% this month',
                style: AppFonts.bodySmall.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountDetails() {
    final details = [
      {'title': 'Account Number', 'value': '****1234'},
      {'title': 'Account Type', 'value': 'Savings Account'},
      {'title': 'Status', 'value': 'Active'},
      {'title': 'Member Since', 'value': 'January 2023'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Details',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...details.map((detail) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail['title']!,
                style: AppFonts.bodyText.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                detail['value']!,
                style: AppFonts.bodyText.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.edit, 'title': 'Edit Profile', 'color': AppColors.primaryBlue},
      {'icon': Icons.security, 'title': 'Security Settings', 'color': AppColors.accentGreen},
      {'icon': Icons.notifications, 'title': 'Notifications', 'color': AppColors.accentOrange},
      {'icon': Icons.help, 'title': 'Help & Support', 'color': AppColors.textSecondary},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...actions.map((action) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Material(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // Handle action tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${action['title']} clicked'),
                    backgroundColor: AppColors.primaryBlue,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (action['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        action['icon'] as IconData,
                        color: action['color'] as Color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        action['title'] as String,
                        style: AppFonts.bodyText.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.textSecondary,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}