import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

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
                          'All Services',
                          style: AppFonts.pageTitle.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Explore all our financial services and products',
                          style: AppFonts.bodyText.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // Main Services
                        _buildServicesSection('Main Services', _getMainServices()),
                        const SizedBox(height: 24),
                        
                        // Account Services
                        _buildServicesSection('Account Services', _getAccountServices()),
                        const SizedBox(height: 24),
                        
                        // Support Services
                        _buildServicesSection('Support & Help', _getSupportServices()),
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
            'Services',
            style: AppFonts.appBarTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(String title, List<Map<String, dynamic>> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return _buildServiceCard(service);
          },
        ),
      ],
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (service['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              service['icon'] as IconData,
              color: service['color'] as Color,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            service['title'] as String,
            textAlign: TextAlign.center,
            style: AppFonts.cardTitle.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service['description'] as String,
            textAlign: TextAlign.center,
            style: AppFonts.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: service['available'] as bool
                  ? AppColors.accentGreen.withOpacity(0.1)
                  : AppColors.accentYellow.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              service['available'] as bool ? 'Available' : 'Coming Soon',
              style: AppFonts.labelSmall.copyWith(
                color: service['available'] as bool
                    ? AppColors.accentGreen
                    : AppColors.accentYellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getMainServices() {
    return [
      {
        'icon': Icons.account_balance_wallet,
        'title': 'Digital Wallet',
        'description': 'Manage your money digitally',
        'color': AppColors.primaryBlue,
        'available': true,
      },
      {
        'icon': Icons.monetization_on,
        'title': 'Quick Loans',
        'description': 'Fast loan approval process',
        'color': AppColors.accentGreen,
        'available': true,
      },
      {
        'icon': Icons.credit_card,
        'title': 'Credit Cards',
        'description': 'Apply for credit cards',
        'color': AppColors.accentOrange,
        'available': true,
      },
      {
        'icon': Icons.savings,
        'title': 'Savings Account',
        'description': 'High-yield savings options',
        'color': AppColors.primaryBlue,
        'available': true,
      },
    ];
  }

  List<Map<String, dynamic>> _getAccountServices() {
    return [
      {
        'icon': Icons.account_balance,
        'title': 'Bank Transfer',
        'description': 'Transfer money between accounts',
        'color': AppColors.primaryBlue,
        'available': true,
      },
      {
        'icon': Icons.receipt,
        'title': 'Bill Payment',
        'description': 'Pay your bills online',
        'color': AppColors.accentGreen,
        'available': true,
      },
      {
        'icon': Icons.mobile_friendly,
        'title': 'Mobile Banking',
        'description': 'Banking on your mobile',
        'color': AppColors.accentOrange,
        'available': true,
      },
      {
        'icon': Icons.qr_code,
        'title': 'QR Payments',
        'description': 'Pay with QR codes',
        'color': AppColors.primaryBlue,
        'available': false,
      },
    ];
  }

  List<Map<String, dynamic>> _getSupportServices() {
    return [
      {
        'icon': Icons.support_agent,
        'title': '24/7 Support',
        'description': 'Round-the-clock customer service',
        'color': AppColors.accentGreen,
        'available': true,
      },
      {
        'icon': Icons.security,
        'title': 'Security Center',
        'description': 'Account security settings',
        'color': AppColors.accentRed,
        'available': true,
      },
      {
        'icon': Icons.help,
        'title': 'Help Center',
        'description': 'FAQs and guides',
        'color': AppColors.accentOrange,
        'available': true,
      },
      {
        'icon': Icons.feedback,
        'title': 'Feedback',
        'description': 'Share your experience',
        'color': AppColors.primaryBlue,
        'available': true,
      },
    ];
  }
}