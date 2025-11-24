import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'profile_detail_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Column(
          children: [
            // Header with back button and logo
            _buildHeader(context),
            
            // Profile content with curved top
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Profile section with credit score
                    _buildProfileSection(),
                    
                    // Settings menu
                    Expanded(
                      child: _buildSettingsMenu(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
            const Spacer(),
            // Full Logo (same as home page)
            Container(
              height: 40,
              constraints: const BoxConstraints(maxWidth: 180),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'LUYLEUN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const SizedBox(width: 24), // Balance for back button
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Transform.translate(
      offset: const Offset(0, -30), // Move up to overlap with blue section
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Profile picture with camera icon
            Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile_placeholder.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            
            // Credit score section
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your credit score',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Excellent (110)',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsMenu(BuildContext context) {
    final menuItems = [
      {
        'icon': Icons.person_outline,
        'title': 'My profile',
        'hasArrow': true,
        'color': Colors.black,
      },
      {
        'icon': Icons.card_giftcard_outlined,
        'title': 'Reward Gift',
        'hasArrow': false,
        'color': Colors.black,
      },
      {
        'icon': Icons.lock_outline,
        'title': 'Change password',
        'hasArrow': false,
        'color': Colors.black,
      },
      {
        'icon': Icons.people_outline,
        'title': 'Referral',
        'hasArrow': false,
        'color': Colors.black,
      },
      {
        'icon': Icons.description_outlined,
        'title': 'Term & Conditions',
        'hasArrow': false,
        'color': Colors.black,
      },
      {
        'icon': Icons.language,
        'title': 'Language',
        'hasArrow': true,
        'subtitle': 'English',
        'color': Colors.black,
      },
      {
        'icon': Icons.logout,
        'title': 'Log out',
        'hasArrow': false,
        'color': Colors.red,
      },
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          const SizedBox(height: 20), // Space after profile section
          ...menuItems.map((item) => _buildMenuItem(
            icon: item['icon'] as IconData,
            title: item['title'] as String,
            hasArrow: item['hasArrow'] as bool,
            subtitle: item['subtitle'] as String?,
            color: item['color'] as Color,
              onTap: () {
                if (item['title'] == 'My profile') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailPage(),
                    ),
                  );
                } else {
                  print('Tapped: ${item['title']}');
                }
              },
          )),
          
          const Spacer(),
          
          // App version
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'App version: V 3.2.9',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool hasArrow,
    String? subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppFonts.serviceLabel.copyWith(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (subtitle != null) ...[
              Text(
                subtitle,
                style: AppFonts.serviceLabel.copyWith(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (hasArrow)
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}