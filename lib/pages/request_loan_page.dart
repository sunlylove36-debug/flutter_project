import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'occupation_form_page.dart';
import 'profile_identity_form_page.dart';
import 'emergency_contact_form_page.dart';

class RequestLoanPage extends StatefulWidget {
  const RequestLoanPage({super.key});

  @override
  State<RequestLoanPage> createState() => _RequestLoanPageState();
}

class _RequestLoanPageState extends State<RequestLoanPage> {
  String? _selectedCategory;
  
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Profile / Identity',
      'icon': Icons.badge,
      'color': const Color(0xFF1953EA),
      'id': 'profile',
    },
    {
      'title': 'Occupation',
      'icon': Icons.work_outline,
      'color': const Color(0xFF1953EA),
      'id': 'occupation',
    },
    {
      'title': 'Emergency Contact information',
      'icon': Icons.contact_phone,
      'color': const Color(0xFF1953EA),
      'id': 'emergency',
    },
    {
      'title': 'Credit information',
      'icon': Icons.credit_card,
      'color': const Color(0xFF1953EA),
      'id': 'credit',
    },
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1953EA), Color(0xFF1953EA)],
          ),
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
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Category List
                      Expanded(
                        child: ListView.builder(
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            final isSelected = _selectedCategory == category['id'];
                            
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = category['id'];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? const Color(0xFF1953EA).withOpacity(0.1)
                                        : const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSelected 
                                          ? const Color(0xFF1953EA)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: category['color'],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          category['icon'],
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          category['title'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF2D3748),
                                          ),
                                        ),
                                      ),
                                      if (isSelected)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Color(0xFF1953EA),
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Verify Information Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _selectedCategory != null ? _verifyInformation : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1953EA),
                            disabledBackgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Verify information',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Subtitle
                      const Text(
                        'To continue, please fill out the from above',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF718096),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyInformation() {
    // Navigate to the specific form based on selected category
    switch (_selectedCategory) {
      case 'profile':
        _showProfileForm();
        break;
      case 'occupation':
        _showOccupationForm();
        break;
      case 'emergency':
        _showEmergencyContactForm();
        break;
      case 'credit':
        _showCreditInformationForm();
        break;
    }
  }
  
  void _showProfileForm() {
    // Navigate to profile/identity form page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileIdentityFormPage(),
      ),
    );
  }
  
  void _showOccupationForm() {
    // Navigate to occupation form page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OccupationFormPage(),
      ),
    );
  }
  
  void _showEmergencyContactForm() {
    // Navigate to emergency contact form page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmergencyContactFormPage(),
      ),
    );
  }
  
  void _showCreditInformationForm() {
    // Show credit information form
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Credit Information'),
        content: const Text('Credit information form will be shown here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
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
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Request form',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}