import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class RequestLoanPage extends StatefulWidget {
  const RequestLoanPage({super.key});

  @override
  State<RequestLoanPage> createState() => _RequestLoanPageState();
}

class _RequestLoanPageState extends State<RequestLoanPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _loanAmountController = TextEditingController();
  final _monthlyIncomeController = TextEditingController();
  final _addressController = TextEditingController();
  
  String _selectedLoanType = 'Personal Loan';
  String _selectedLoanTerm = '12 months';
  bool _agreedToTerms = false;

  final List<String> _loanTypes = [
    'Personal Loan',
    'Business Loan',
    'Education Loan',
    'Home Loan',
    'Car Loan',
  ];

  final List<String> _loanTerms = [
    '6 months',
    '12 months',
    '18 months',
    '24 months',
    '36 months',
    '48 months',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _loanAmountController.dispose();
    _monthlyIncomeController.dispose();
    _addressController.dispose();
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
              // Form Content
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Loan Application',
                            style: AppFonts.pageTitle.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Please fill out the form below to apply for a loan',
                            style: AppFonts.bodyText.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 30),
                          
                          // Personal Information Section
                          _buildSectionHeader('Personal Information'),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _fullNameController,
                            label: 'Full Name',
                            hint: 'Enter your full name',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _phoneController,
                            label: 'Phone Number',
                            hint: 'Enter your phone number',
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _emailController,
                            label: 'Email Address',
                            hint: 'Enter your email address',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _addressController,
                            label: 'Address',
                            hint: 'Enter your full address',
                            icon: Icons.location_on,
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Loan Information Section
                          _buildSectionHeader('Loan Information'),
                          const SizedBox(height: 16),
                          _buildDropdownField(
                            label: 'Loan Type',
                            value: _selectedLoanType,
                            items: _loanTypes,
                            icon: Icons.category,
                            onChanged: (value) {
                              setState(() {
                                _selectedLoanType = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _loanAmountController,
                            label: 'Loan Amount (USD)',
                            hint: 'Enter desired loan amount',
                            icon: Icons.monetization_on,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter loan amount';
                              }
                              final amount = double.tryParse(value);
                              if (amount == null || amount <= 0) {
                                return 'Please enter a valid amount';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildDropdownField(
                            label: 'Loan Term',
                            value: _selectedLoanTerm,
                            items: _loanTerms,
                            icon: Icons.schedule,
                            onChanged: (value) {
                              setState(() {
                                _selectedLoanTerm = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _monthlyIncomeController,
                            label: 'Monthly Income (USD)',
                            hint: 'Enter your monthly income',
                            icon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your monthly income';
                              }
                              final income = double.tryParse(value);
                              if (income == null || income <= 0) {
                                return 'Please enter a valid income amount';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Terms and Conditions
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _agreedToTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreedToTerms = value ?? false;
                                  });
                                },
                                activeColor: AppColors.primaryBlue,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _agreedToTerms = !_agreedToTerms;
                                    });
                                  },
                                  child: Text(
                                    'I agree to the Terms and Conditions and Privacy Policy',
                                    style: AppFonts.bodyText.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _agreedToTerms ? _submitForm : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
                                disabledBackgroundColor: AppColors.textSecondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 2,
                              ),
                              child: Text(
                                'Submit Application',
                                style: AppFonts.buttonText.copyWith(
                                  color: AppColors.textLight,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                        ],
                      ),
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
            'Request Loan',
            style: AppFonts.appBarTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppFonts.sectionTitle.copyWith(
        color: AppColors.textPrimary,
        fontSize: 20,
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primaryBlue),
            filled: true,
            fillColor: AppColors.backgroundLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error),
            ),
            hintStyle: AppFonts.bodyText.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          style: AppFonts.bodyText.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.primaryBlue),
            filled: true,
            fillColor: AppColors.backgroundLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
            ),
          ),
          style: AppFonts.bodyText.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Application Submitted',
              style: AppFonts.dialogTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            content: Text(
              'Your loan application has been submitted successfully. We will review your application and get back to you within 2-3 business days.',
              style: AppFonts.bodyText.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(); // Go back to home
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
}