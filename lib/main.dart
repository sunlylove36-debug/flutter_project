import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_colors.dart';
import 'constants/app_fonts.dart';
import 'constants/app_theme.dart';
import 'services/form_service.dart';
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
    return ChangeNotifierProvider(
      create: (context) => FormService(),
      child: MaterialApp(
        title: 'Fintech App',
        theme: AppTheme.lightTheme,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % 3;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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


                  

                  // Service Grid
                  _buildServiceGrid(),
                  const SizedBox(height: 30),

                  // Slide Banner
                  _buildSlideBanner(),
                  const SizedBox(height: 30),


                

                  // Referrals Section
                  _buildReferralsSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu icon
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
          
          // Full Logo (no additional text needed)
          Container(
            height: 50,
            constraints: const BoxConstraints(maxWidth: 200),
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
          
          // Action icons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 22,
              ),
              const SizedBox(width: 4),
              Container(
                width: 1,
                height: 20,
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 22,
              ),
            ],
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

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: GridView.builder(
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
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
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

  Widget _buildSlideBanner() {
    final banners = [
      {
        'title': 'Special Loan Offer',
        'subtitle': 'Get up to \$5000 with low interest',
        'image': 'assets/images/banner1.png', // You can add custom banner images here
        'color': AppColors.primaryBlue,
        'icon': Icons.monetization_on,
      },
      {
        'title': 'Quick Approval',
        'subtitle': 'Instant approval in 24 hours',
        'image': 'assets/images/banner2.png', // You can add custom banner images here
        'color': AppColors.primaryDarkBlue,
        'icon': Icons.flash_on,
      },
      {
        'title': 'Mobile Banking',
        'subtitle': 'Manage your loans on the go',
        'image': 'assets/images/banner3.png', // You can add custom banner images here
        'color': const Color(0xFF4A90E2),
        'icon': Icons.mobile_friendly,
      },
    ];

    return Container(
      height: 150,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final banner = banners[index];
          
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  // Background Image (if provided)
                  if (banner['image'] != null)
                    Positioned.fill(
                      child: Image.asset(
                        banner['image'] as String,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback to gradient if image not found
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  banner['color'] as Color,
                                  (banner['color'] as Color).withOpacity(0.8),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    // Fallback gradient background
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              banner['color'] as Color,
                              (banner['color'] as Color).withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                  // Content overlay
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  banner['title'] as String,
                                  style: AppFonts.cardTitle.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  banner['subtitle'] as String,
                                  style: AppFonts.serviceLabel.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 12,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                banner['icon'] as IconData,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
