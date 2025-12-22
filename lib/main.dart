import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'constants/app_colors.dart';
import 'constants/app_fonts.dart';
import 'constants/app_theme.dart';
import 'services/form_service.dart';
import 'pages/account_page.dart';
import 'pages/request_loan_page.dart';
// import 'pages/repayment_page.dart';
import 'pages/loan_calculator_page.dart';
import 'pages/referral_page.dart';
import 'pages/service_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormService(),
      child: AdaptiveApp(
        title: 'Fintech App',
        themeMode: ThemeMode.system,
        materialLightTheme: AppTheme.lightTheme,
        materialDarkTheme: ThemeData.dark(),
        cupertinoLightTheme: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
        cupertinoDarkTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US'), Locale('km', 'KH')],
        home: const MainNavigationPage(),
      ),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const RequestLoanPage(),
    const AccountPage(),
    const ReferralPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AdaptiveBottomNavigationBar(
        useNativeBottomBar: true,
        items: [
          AdaptiveNavigationDestination(icon: 'house.fill', label: 'Home'),
          AdaptiveNavigationDestination(
            icon: 'dollarsign.circle.fill',
            label: 'Loans',
          ),
          AdaptiveNavigationDestination(
            icon: 'chart.bar.fill',
            label: 'Activity',
          ),
          AdaptiveNavigationDestination(icon: 'gift.fill', label: 'Rewards'),
          AdaptiveNavigationDestination(icon: 'person.fill', label: 'Profile'),
        ],
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // iOS Native Navigation Bar
                _buildIOSNavBar(),
                const SizedBox(height: 20),

                // Greeting
                Text(
                  'Good morning!',
                  style: AppFonts.greeting.copyWith(color: AppColors.textLight),
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
    );
  }

  // iOS Native Navigation Bar
  Widget _buildIOSNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu Button - iOS Style
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Icon(
              CupertinoIcons.line_horizontal_3,
              color: Colors.white,
              size: 26,
            ),
          ),

          // Logo
          Expanded(
            child: Center(
              child: Container(
                height: 36,
                constraints: const BoxConstraints(maxWidth: 180),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'LUYLEUN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Notification Button with Badge
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      CupertinoIcons.bell_fill,
                      color: Colors.white,
                      size: 24,
                    ),
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemRed,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              // Chat Button
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: Colors.white,
                  size: 24,
                ),
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
        'icon': 'assets/images/account.png',
        'title': 'Account',
        'fallbackIcon': Icons.account_balance_wallet,
      },
      {
        'icon': 'assets/images/loan.png',
        'title': 'Digital Loan',
        'fallbackIcon': Icons.attach_money,
      },
      {
        'icon': 'assets/images/calculator.png',
        'title': 'Financial Tools',
        'fallbackIcon': Icons.calculate,
      },
      {
        'icon': 'assets/images/calculator.png',
        'title': 'Education',
        'fallbackIcon': Icons.school,
      },
      {
        'icon': 'assets/images/inviteFri.png',
        'title': 'Job Listing',
        'fallbackIcon': Icons.work,
      },
      {
        'icon': 'assets/images/service.png',
        'title': 'Service',
        'fallbackIcon': Icons.apps,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
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
                    MaterialPageRoute(
                      builder: (context) => const AccountPage(),
                    ),
                  );
                  break;
                case 'Digital Loan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RequestLoanPage(),
                    ),
                  );
                  break;
                case 'Financial Tools':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoanCalculatorPage(),
                    ),
                  );
                  break;
                case 'Service':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ServicePage(),
                    ),
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

  Widget _buildServiceIcon(String imagePath, IconData fallbackIcon) {
    if (fallbackIcon == Icons.account_balance_wallet ||
        fallbackIcon == Icons.attach_money ||
        fallbackIcon == Icons.trending_up) {
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
            if (fallbackIcon == Icons.account_balance_wallet) {
              return Icon(
                Icons.payment,
                color: AppColors.primaryBlue,
                size: 30,
              );
            } else if (fallbackIcon == Icons.attach_money) {
              return Icon(
                Icons.attach_money,
                color: AppColors.primaryBlue,
                size: 30,
              );
            } else {
              return Icon(
                Icons.calculate,
                color: AppColors.primaryBlue,
                size: 30,
              );
            }
          },
        ),
      );
    }

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
      {'image': 'assets/images/banner.jpg', 'color': AppColors.primaryBlue},
      {
        'image': 'assets/images/banner1.jpg',
        'color': AppColors.primaryDarkBlue,
      },
      {'image': 'assets/images/banner2.jpg', 'color': const Color(0xFF4A90E2)},
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
