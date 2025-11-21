import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class KhmerFontDemo extends StatelessWidget {
  const KhmerFontDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'គំរូពុម្ពអក្សរខ្មែរ',
          style: AppFonts.khmerAppTitle.copyWith(
            color: AppColors.textLight,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowLight,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ជំរាបសួរ!',
                        style: AppFonts.khmerHeadline3.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'សូមស្វាគមន៍មកកាន់កម្មវិធីហិរញ្ញវត្ថុ',
                        style: AppFonts.khmerBodyLarge.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Banking Services Section
                Text(
                  'សេវាកម្មធនាគារ',
                  style: AppFonts.khmerSectionTitle.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                _buildServiceCard(
                  'គណនីធនាគារ',
                  'បង្កើតនិងគ្រប់គ្រងគណនីរបស់អ្នក',
                  Icons.account_balance,
                ),
                
                const SizedBox(height: 12),
                
                _buildServiceCard(
                  'សុំកម្ចី',
                  'ដាក់ពាក្យសុំកម្ចីអនឡាញ',
                  Icons.monetization_on,
                ),
                
                const SizedBox(height: 12),
                
                _buildServiceCard(
                  'សងប្រាក់',
                  'ធ្វើការទូទាត់កម្ចី',
                  Icons.payment,
                ),
                
                const SizedBox(height: 20),
                
                // Loan Information Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDarkBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ព័ត៌មានកម្ចី',
                        style: AppFonts.khmerHeadline4.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      _buildLoanInfoRow('ចំនួនកម្ចីអតិបរមា', '៥០,០០០ ដុល្លារ'),
                      _buildLoanInfoRow('អត្រាការប្រាក់', '៨.៥% ក្នុងមួយឆ្នាំ'),
                      _buildLoanInfoRow('រយៈពេលសងប្រាក់', '១-៥ ឆ្នាំ'),
                      _buildLoanInfoRow('ការអនុម័ត', '២៤ ម៉ោង'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Typography Examples
                Text(
                  'គំរូពុម្ពអក្សរ',
                  style: AppFonts.khmerSectionTitle.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ចំណងជើងធំ', style: AppFonts.khmerHeadline1.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      Text('ចំណងជើងមធ្យម', style: AppFonts.khmerHeadline3.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      Text('ចំណងជើងតូច', style: AppFonts.khmerHeadline6.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 16),
                      Text('អត្ថបទធម្មតា', style: AppFonts.khmerBodyMedium.copyWith(color: AppColors.textPrimary)),
                      Text('អត្ថបទតូច', style: AppFonts.khmerBodySmall.copyWith(color: AppColors.textSecondary)),
                      const SizedBox(height: 16),
                      Text('ស្លាកសម្គាល់ធំ', style: AppFonts.khmerLabelLarge.copyWith(color: AppColors.primaryBlue)),
                      Text('ស្លាកសម្គាល់តូច', style: AppFonts.khmerLabelSmall.copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Contact Information
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.accentGreen),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ទំនាក់ទំនងយើងខ្ញុំ',
                        style: AppFonts.khmerHeadline5.copyWith(
                          color: AppColors.accentGreen,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ទូរស័ព្ទ: ០២៣ ២២២ ៣៣៣\nអ៊ីមែល: info@fintechapp.kh\nអាសយដ្ឋាន: ភ្នំពេញ កម្ពុជា',
                        style: AppFonts.khmerBodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.khmerCardTitle.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppFonts.khmerBodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoanInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppFonts.khmerBodyMedium.copyWith(
              color: AppColors.textLight.withOpacity(0.8),
            ),
          ),
          Text(
            value,
            style: AppFonts.khmerLabelMedium.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}