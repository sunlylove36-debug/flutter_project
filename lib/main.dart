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
import 'pages/profile_page.dart';
import 'dart:ui';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDarkBlue,
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
                  const SizedBox(height: 20),

                  // Slide Banner
                  _buildSlideBanner(),
                  const SizedBox(height: 20),      

                  // Referrals Section
                  _buildReferralsSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
  margin: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Loan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          // Full Logo (no additional text needed)
          Container(
            height: 40,
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
                Icons.chat,
                color: Colors.white,
                size: 20,
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
        'title': 'Digital Loan',
        'fallbackIcon': Icons.attach_money,
      },
      {
        'icon':
            'assets/images/calculator.png', // Add your custom repayment icon
        'title': 'Financial Tools',
        'fallbackIcon': Icons.calculate,
      },
      {
        'icon':
            'assets/images/calculator.png', // Add your custom calculator icon
        'title': 'Education',
        'fallbackIcon': Icons.school,
      },
      {
        'icon': 'assets/images/inviteFri.png', // Add your custom referral icon
        'title': 'Job Listing',
        'fallbackIcon': Icons.work,
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
                      fontWeight: FontWeight.w500,
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

  // Helper method to build service icons
  Widget _buildServiceIcon(String imagePath, IconData fallbackIcon) {
    // Load image for Account, Digital Loan, and Financial Tools services
    if (fallbackIcon == Icons.account_balance_wallet || fallbackIcon == Icons.attach_money || fallbackIcon == Icons.trending_up) {
      // Use calculator.png specifically for Financial Tools
      String assetPath = imagePath;
      if (fallbackIcon == Icons.trending_up) {
        assetPath = 'assets/images/calculator.png';
      }
      
      return SizedBox(
        width: 30,
        height: 30,
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback icons
            if (fallbackIcon == Icons.account_balance_wallet) {
              return Icon(Icons.payment, color: AppColors.primaryBlue, size: 30);
            } else if (fallbackIcon == Icons.attach_money) {
              return Icon(Icons.attach_money, color: AppColors.primaryBlue, size: 30);
            } else {
              return Icon(Icons.calculate, color: AppColors.primaryBlue, size: 30);
            }
          },
        ),
      );
    }
    
    // Map service titles to custom icon displays for other services
    final iconMap = {
      Icons.school: Icons.school,
      Icons.work: Icons.business_center,
      Icons.apps: Icons.miscellaneous_services,
    };
    
    final displayIcon = iconMap[fallbackIcon] ?? fallbackIcon;
    return Icon(displayIcon, color: AppColors.primaryBlue, size: 30);
  }

  Widget _buildSlideBanner() {
  final banners = [
    {
      'image': 'assets/images/banner.jpg',
      'color': AppColors.primaryBlue,
    },
    {
      'image': 'assets/images/banner1.jpg',
      'color': AppColors.primaryDarkBlue,
    },
    {
      'image': 'assets/images/banner2.jpg',
      'color': const Color(0xFF4A90E2),
    },
  ];

  return SizedBox(
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
