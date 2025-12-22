import 'package:flutter/material.dart';

class CreditInformationFormPage extends StatefulWidget {
  final VoidCallback? onFormCompleted;
  
  const CreditInformationFormPage({super.key, this.onFormCompleted});

  @override
  State<CreditInformationFormPage> createState() => _CreditInformationFormPageState();
}

class _CreditInformationFormPageState extends State<CreditInformationFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final _accountNameController = TextEditingController();
  final _bankNumberController = List.generate(7, (index) => TextEditingController());
  
  // Selected values
  String? _selectedCashSize;
  int _loanPeriod = 15;
  String _selectedLoanPurpose = 'Expand business';
  String _selectedBankAccount = 'ACLEDA Bank';

  // Cash size options
  final List<Map<String, dynamic>> _cashSizeOptions = [
    {'amount': 50, 'selected': false},
    {'amount': 100, 'selected': false},
    {'amount': 150, 'selected': false},
    {'amount': 200, 'selected': false},
    {'amount': 250, 'selected': false},
    {'amount': 300, 'selected': false},
    {'amount': 350, 'selected': false},
    {'amount': null, 'label': 'Optional\nLoan', 'selected': false},
  ];

  final List<String> _loanPurposeOptions = [
    'Expand business',
    'Payment',
    'Personal use',
    'Education',
    'Emergency',
    'Investment',
  ];

  final List<String> _bankAccountOptions = [
    'ACLEDA Bank',
    'Canadia Bank',
    'ABA Bank',
    'Prasac Bank',
    'Foreign Trade Bank',
    'Cambodia Public Bank',
  ];

  @override
  void dispose() {
    _accountNameController.dispose();
    for (var controller in _bankNumberController) {
      controller.dispose();
    }
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
          bottom: false,
          child: Column(
            children: [
              // Custom App Bar with Progress
              _buildCustomAppBar(context),
              // Progress Indicator
              _buildProgressIndicator(),
              // Form Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Credit Information Section
                          _buildCreditInformationSection(),
                          const SizedBox(height: 24),
                          
                          // Choose Period Section
                          _buildChoosePeriodSection(),
                          const SizedBox(height: 24),
                          
                          // Loan Purpose Section
                          _buildLoanPurposeSection(),
                          const SizedBox(height: 24),
                          
                          // Receipt Account Section
                          _buildReceiptAccountSection(),
                          const SizedBox(height: 32),
                          
                          // Next Button
                          _buildNextButton(),
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
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Credit Information',
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

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildProgressStep(1, 'Profile/Identity', true),
          _buildProgressLine(true),
          _buildProgressStep(2, 'Occupation', true),
          _buildProgressLine(true),
          _buildProgressStep(3, 'Emergency contact\ninformation', true),
          _buildProgressLine(true),
          _buildProgressStep(4, 'Credit\ninformation', true),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    final isActive = step == 4; // Credit information is step 4
    
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted || isActive ? Colors.white : Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$step',
                style: TextStyle(
                  color: isCompleted || isActive ? const Color(0xFF1953EA) : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Container(
      height: 2,
      width: 40,
      color: isCompleted ? Colors.white : Colors.white.withOpacity(0.3),
    );
  }

  Widget _buildCreditInformationSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Credit information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          const Text(
            'Select Cash Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          
          // Cash size grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
            children: _cashSizeOptions.map((option) {
              final isSelected = _selectedCashSize == (option['amount']?.toString() ?? 'optional');
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCashSize = option['amount']?.toString() ?? 'optional';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? const Color(0xFF1953EA) 
                        : (option['amount'] == null 
                            ? Colors.grey[400] 
                            : const Color(0xFF8BB6FF)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      option['amount'] != null 
                          ? '\$${option['amount']}'
                          : option['label'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: option['amount'] != null ? 16 : 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChoosePeriodSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose a period',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Period slider
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1953EA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$_loanPeriod/4',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '$_loanPeriod days',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF1953EA),
                  inactiveTrackColor: Colors.grey[300],
                  thumbColor: const Color(0xFF1953EA),
                  overlayColor: const Color(0xFF1953EA).withOpacity(0.2),
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                  trackHeight: 6,
                ),
                child: Slider(
                  value: _loanPeriod.toDouble(),
                  min: 15,
                  max: 150,
                  divisions: 9,
                  onChanged: (value) {
                    setState(() {
                      _loanPeriod = value.round();
                    });
                  },
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('30', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('60', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('90', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('120', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('150', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoanPurposeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Loan Purpose',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          
          ..._loanPurposeOptions.map((purpose) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: RadioListTile<String>(
                title: Text(
                  purpose,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2D3748),
                  ),
                ),
                value: purpose,
                groupValue: _selectedLoanPurpose,
                onChanged: (value) {
                  setState(() {
                    _selectedLoanPurpose = value!;
                  });
                },
                activeColor: const Color(0xFF1953EA),
                contentPadding: EdgeInsets.zero,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildReceiptAccountSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Receipt Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Bank account dropdown
          _buildDropdownField(
            label: 'Bank account',
            value: _selectedBankAccount,
            items: _bankAccountOptions,
            hint: 'Bank account',
            onChanged: (value) {
              setState(() {
                _selectedBankAccount = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          
          // Account name
          _buildFormField(
            label: 'Account Name',
            controller: _accountNameController,
            hint: 'Account name',
          ),
          const SizedBox(height: 16),
          
          // Bank number
          const Text(
            'Bank Number',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index < 6 ? 8 : 0),
                  child: TextFormField(
                    controller: _bankNumberController[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 6) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFFA0AEC0),
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: Color(0xFFE2E8F0)),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final isSelected = item == value;
                            return GestureDetector(
                              onTap: () {
                                onChanged(item);
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: isSelected ? const Color(0xFFF3F4F6) : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: const Color(0xFF2D3748),
                                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      if (isSelected)
                                        const Icon(
                                          Icons.check,
                                          color: Color(0xFF1953EA),
                                          size: 20,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFCBD5E1),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF9CA3AF),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1953EA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCashSize == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a cash size')),
        );
        return;
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All forms completed successfully! Loan application submitted.'),
          duration: Duration(seconds: 3),
        ),
      );
      widget.onFormCompleted?.call();
      
      // Return to main page after completion of all forms
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}
