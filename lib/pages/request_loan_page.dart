import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/form_service.dart';
import 'occupation_form_page.dart';
import 'profile_identity_form_page.dart';
import 'emergency_contact_form_page.dart';
import 'credit_information_form_page.dart';

class RequestLoanPage extends StatefulWidget {
  const RequestLoanPage({super.key});

  @override
  State<RequestLoanPage> createState() => _RequestLoanPageState();
}

class _RequestLoanPageState extends State<RequestLoanPage> {
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
  Widget build(BuildContext context) {
    return Consumer<FormService>(
      builder: (context, formService, child) {
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
                          // Progress indicator
                          _buildProgressIndicator(formService),
                          const SizedBox(height: 24),
                          
                          // Category List
                          Expanded(
                            child: ListView.builder(
                              itemCount: _categories.length,
                              itemBuilder: (context, index) {
                                final category = _categories[index];
                                final isCompleted = formService.isFormCompleted(category['id']);
                                
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: GestureDetector(
                                    onTap: () {
                                      _navigateToForm(category['id'], formService);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: isCompleted 
                                            ? const Color(0xFF1953EA).withOpacity(0.1)
                                            : const Color(0xFFF5F5F5),
                                        borderRadius: BorderRadius.circular(16),
                                        border: isCompleted 
                                            ? Border.all(color: const Color(0xFF1953EA), width: 2)
                                            : null,
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
                                          if (isCompleted)
                                            const Icon(
                                              Icons.check_circle,
                                              color: Color(0xFF1953EA),
                                              size: 24,
                                            )
                                          else
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF718096),
                                              size: 16,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          
                          // Verify Information Button (shows if there are incomplete forms)
                          if (formService.completedFormsCount < _categories.length)
                            _buildVerifyInformationButton(formService),
                          
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
      },
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
            'Request Loan',
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

  Widget _buildProgressIndicator(FormService formService) {
    final completedCount = formService.completedFormsCount;
    final totalForms = _categories.length;
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Loan Application Progress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
            Text(
              '$completedCount/$totalForms completed',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF718096),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: formService.completionPercentage,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1953EA)),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildVerifyInformationButton(FormService formService) {
    final incompleteForms = _getIncompleteForms(formService);
    
    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _showIncompleteFormsDialog(incompleteForms, formService),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Verify Information (${incompleteForms.length} missing)',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Complete all forms to proceed with your loan application',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _getIncompleteForms(FormService formService) {
    return _categories.where((category) => 
      !formService.isFormCompleted(category['id'])
    ).toList();
  }

  void _showIncompleteFormsDialog(List<Map<String, dynamic>> incompleteForms, FormService formService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Color(0xFF1953EA),
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              'Missing Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please complete the following forms to proceed:',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF718096),
              ),
            ),
            const SizedBox(height: 16),
            ...incompleteForms.map((form) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: form['color'],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      form['icon'],
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      form['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _navigateToForm(form['id'], formService);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1953EA),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Complete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(
                color: Color(0xFF1953EA),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToForm(String categoryId, FormService formService) async {
    Widget? targetPage;
    
    switch (categoryId) {
      case 'profile':
        targetPage = ProfileIdentityFormPage(
          onFormCompleted: () => formService.markFormCompleted('profile'),
        );
        break;
      case 'occupation':
        targetPage = OccupationFormPage(
          onFormCompleted: () => formService.markFormCompleted('occupation'),
        );
        break;
      case 'emergency':
        targetPage = EmergencyContactFormPage(
          onFormCompleted: () => formService.markFormCompleted('emergency'),
        );
        break;
      case 'credit':
        targetPage = CreditInformationFormPage(
          onFormCompleted: () => formService.markFormCompleted('credit'),
        );
        break;
    }
    
    if (targetPage != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage!),
      );
    }
  }
}