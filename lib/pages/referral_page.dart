import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final _referralCodeController = TextEditingController();
  final String _myReferralCode = 'REF123ABC';
  
  final List<Map<String, dynamic>> _referralHistory = [
    {'name': 'John Smith', 'date': 'Nov 15, 2025', 'status': 'Completed', 'reward': '\$50'},
    {'name': 'Sarah Johnson', 'date': 'Oct 28, 2025', 'status': 'Pending', 'reward': '\$50'},
    {'name': 'Mike Chen', 'date': 'Oct 12, 2025', 'status': 'Completed', 'reward': '\$50'},
    {'name': 'Lisa Brown', 'date': 'Sep 30, 2025', 'status': 'Completed', 'reward': '\$50'},
  ];

  @override
  void dispose() {
    _referralCodeController.dispose();
    super.dispose();
  }

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
                          'Referral Program',
                          style: AppFonts.pageTitle.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Earn rewards by referring friends to our platform',
                          style: AppFonts.bodyText.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // Referral Stats
                        _buildReferralStats(),
                        const SizedBox(height: 24),
                        
                        // My Referral Code
                        _buildMyReferralCode(),
                        const SizedBox(height: 24),
                        
                        // Enter Referral Code
                        _buildEnterReferralCode(),
                        const SizedBox(height: 24),
                        
                        // How it Works
                        _buildHowItWorks(),
                        const SizedBox(height: 24),
                        
                        // Referral History
                        _buildReferralHistory(),
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
            'Referral',
            style: AppFonts.appBarTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralStats() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.successGradient,
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
        children: [
          Text(
            'Your Referral Stats',
            style: AppFonts.sectionTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '4',
                      style: AppFonts.headline3.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                    Text(
                      'Total Referrals',
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: AppColors.textLight.withOpacity(0.3),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '3',
                      style: AppFonts.headline3.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                    Text(
                      'Successful',
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: AppColors.textLight.withOpacity(0.3),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '\$150',
                      style: AppFonts.headline3.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                    Text(
                      'Total Earned',
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMyReferralCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Referral Code',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryBlue.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share this code with friends',
                          style: AppFonts.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _myReferralCode,
                            style: AppFonts.headline6.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      IconButton(
                        onPressed: _copyReferralCode,
                        icon: const Icon(Icons.copy),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          foregroundColor: AppColors.textLight,
                        ),
                      ),
                      const SizedBox(height: 8),
                      IconButton(
                        onPressed: _shareReferralCode,
                        icon: const Icon(Icons.share),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.accentGreen,
                          foregroundColor: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEnterReferralCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Referral Code',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _referralCodeController,
                decoration: InputDecoration(
                  hintText: 'Enter friend\'s referral code',
                  prefixIcon: const Icon(Icons.card_giftcard, color: AppColors.primaryBlue),
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: _applyReferralCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Apply',
                style: AppFonts.buttonText.copyWith(
                  color: AppColors.textLight,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHowItWorks() {
    final steps = [
      {'icon': Icons.person_add, 'title': 'Invite Friends', 'description': 'Share your referral code with friends'},
      {'icon': Icons.app_registration, 'title': 'Friend Signs Up', 'description': 'They register using your code'},
      {'icon': Icons.monetization_on, 'title': 'Get Loan', 'description': 'They successfully get approved for a loan'},
      {'icon': Icons.card_giftcard, 'title': 'Earn Rewards', 'description': 'Both of you receive \$50 bonus'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How It Works',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...steps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: AppFonts.bodyText.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              step['icon'] as IconData,
                              color: AppColors.primaryBlue,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              step['title'] as String,
                              style: AppFonts.cardTitle.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step['description'] as String,
                          style: AppFonts.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildReferralHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Referral History',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ..._referralHistory.map((referral) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                child: Text(
                  (referral['name'] as String).substring(0, 1),
                  style: AppFonts.bodyText.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      referral['name'] as String,
                      style: AppFonts.cardTitle.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      referral['date'] as String,
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: referral['status'] == 'Completed' 
                          ? AppColors.accentGreen.withOpacity(0.1)
                          : AppColors.accentYellow.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      referral['status'] as String,
                      style: AppFonts.labelSmall.copyWith(
                        color: referral['status'] == 'Completed' 
                            ? AppColors.accentGreen
                            : AppColors.accentYellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    referral['reward'] as String,
                    style: AppFonts.bodyText.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ],
    );
  }

  void _copyReferralCode() {
    // Copy to clipboard logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Referral code $_myReferralCode copied to clipboard'),
        backgroundColor: AppColors.accentGreen,
      ),
    );
  }

  void _shareReferralCode() {
    // Share logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sharing referral code...'),
        backgroundColor: AppColors.primaryBlue,
      ),
    );
  }

  void _applyReferralCode() {
    if (_referralCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a referral code'),
          backgroundColor: AppColors.accentRed,
        ),
      );
      return;
    }

    // Apply referral code logic would go here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Referral Code Applied',
            style: AppFonts.dialogTitle.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          content: Text(
            'Referral code ${_referralCodeController.text} has been applied successfully. You\'ll receive your bonus after completing your first loan.',
            style: AppFonts.bodyText.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _referralCodeController.clear();
              },
              child: Text(
                'OK',
                style: AppFonts.buttonText.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}