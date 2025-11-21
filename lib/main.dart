import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_fonts.dart';
import 'constants/app_theme.dart';
import 'pages/account_page.dart';
import 'pages/request_loan_page.dart';
import 'pages/repayment_page.dart';
import 'pages/loan_calculator_page.dart';
import 'pages/referral_page.dart';
import 'pages/service_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech App',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(),
                  const SizedBox(height: 20),

                  // Greeting
                  Text(
                    'Good morning!',
                    style: AppFonts.greeting.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Promotional Banner
                  _buildPromoBanner(),
                  const SizedBox(height: 30),

                  // Service Grid
                  _buildServiceGrid(),
                  const SizedBox(height: 30),

                  // Competition Section
                  _buildCompetitionSection(),
                  const SizedBox(height: 30),

                  // Associations Section
                  _buildAssociationsSection(),
                  const SizedBox(height: 30),

                  // Referrals Section
                  _buildReferralsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu, color: AppColors.textLight, size: 24),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.cardBackground,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'T',
                  style: AppFonts.headline6.copyWith(
                    color: AppColors.primaryBlue,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'LUYLEUN',
              style: AppFonts.khmerAppTitle.copyWith(
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: AppColors.textLight,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.phone,
                color: AppColors.textLight,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkBlue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ទទួលបានកម្ចីវិទ្យុក់',
                  style: AppFonts.khmerPromoTitle.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'ហូតពី ២០០០ដុល្លារ',
                  style: AppFonts.khmerPromoSubtitle.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.overlayLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.textLight,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
    final services = [
      {
        'icon': 'assets/images/account.png', // Add your custom account icon
        'title': 'Account',
        'fallbackIcon':
            Icons.account_balance_wallet, // Fallback if image not found
      },
      {
        'icon': 'assets/images/loan.png', // Add your custom loan icon
        'title': 'Request Loan',
        'fallbackIcon': Icons.monetization_on,
      },
      {
        'icon':
            'assets/images/repayment.png', // Add your custom repayment icon
        'title': 'Repayment',
        'fallbackIcon': Icons.credit_card,
      },
      {
        'icon':
            'assets/images/calculator.png', // Add your custom calculator icon
        'title': 'Loan\nCalculator',
        'fallbackIcon': Icons.calculate,
      },
      {
        'icon': 'assets/images/inviteFri.png', // Add your custom referral icon
        'title': 'Referral',
        'fallbackIcon': Icons.people,
      },
      {
        'icon': 'assets/images/service.png', // Add your custom service icon
        'title': 'Service',
        'fallbackIcon': Icons.apps,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return GestureDetector(
          onTap: () {
            switch (service['title']) {
              case 'Account':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
                break;
              case 'Request Loan':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RequestLoanPage(),
                  ),
                );
                break;
              case 'Repayment':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RepaymentPage(),
                  ),
                );
                break;
              case 'Loan\nCalculator':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoanCalculatorPage(),
                  ),
                );
                break;
              case 'Referral':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReferralPage()),
                );
                break;
              case 'Service':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicePage()),
                );
                break;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildServiceIcon(
                  service['icon'] as String,
                  service['fallbackIcon'] as IconData,
                ),
                const SizedBox(height: 8),
                Text(
                  service['title'] as String,
                  textAlign: TextAlign.center,
                  style: AppFonts.serviceLabel.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper method to build service icons with fallback
  Widget _buildServiceIcon(String imagePath, IconData fallbackIcon) {
    return SizedBox(
      width: 40,
      height: 36,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(fallbackIcon, color: AppColors.primaryBlue, size: 30);
        },
      ),
    );
  }

  Widget _buildCompetitionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Competition program',
          style: AppFonts.sectionTitle.copyWith(color: AppColors.textLight),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildCompetitionCard(
                'Techo Startup Center',
                Icons.business_center,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildCompetitionCard(
                'Cambodian Young\nEntrepreneur Awards',
                Icons.emoji_events,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompetitionCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.overlayLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.textLight, size: 25),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.cardTitle.copyWith(color: AppColors.textLight),
          ),
        ],
      ),
    );
  }

  Widget _buildAssociationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Associations',
          style: AppFonts.sectionTitle.copyWith(color: AppColors.textLight),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAssociationItem('Khmer\nEnterprise'),
            _buildAssociationItem('YEAC'),
            _buildAssociationItem('FASMEC'),
            _buildAssociationItem('CDTA'),
          ],
        ),
      ],
    );
  }

  Widget _buildAssociationItem(String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.overlayLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.business,
            color: AppColors.textLight,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppFonts.associationLabel.copyWith(color: AppColors.textLight),
        ),
      ],
    );
  }

  Widget _buildReferralsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Referrals',
          style: AppFonts.sectionTitle.copyWith(color: AppColors.textLight),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildReferralItem('J', 'JAKKIE JENNIE'),
            _buildReferralItem('K', 'KIM BERRY'),
            _buildReferralItem('R', 'RONALDO'),
          ],
        ),
      ],
    );
  }

  Widget _buildReferralItem(String initial, String name) {
    final colors = [
      const Color(0xFFB85450),
      const Color(0xFF8B4513),
      const Color(0xFF696969),
    ];
    final colorIndex = initial.codeUnitAt(0) % colors.length;

    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: colors[colorIndex],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
