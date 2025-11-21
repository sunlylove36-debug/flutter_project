import 'package:flutter/material.dart';

class OccupationFormPage extends StatefulWidget {
  const OccupationFormPage({super.key});

  @override
  State<OccupationFormPage> createState() => _OccupationFormPageState();
}

class _OccupationFormPageState extends State<OccupationFormPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 1; // Occupation is step 2
  String _selectedOccupation = 'Private Company / Organization staff';
  
  // Form controllers
  final _companyNameController = TextEditingController();
  final _industryTypeController = TextEditingController();
  final _institutionPhoneController = TextEditingController();
  final _salaryController = TextEditingController();
  final _payrollViaController = TextEditingController();
  final _houseNumberController = TextEditingController();
  
  String _selectedPosition = 'Staff';
  String _selectedWorkingHour = '8 hours';
  String _selectedWorkExperience = '1-2 years';
  String _selectedProvince = 'Phnom Penh';
  DateTime? _selectedSalaryPaymentDate;

  final List<String> _occupationTypes = [
    'Private Company / Organization staff',
    'Business Owner',
    'Civil Servants',
  ];

  final List<String> _positions = [
    'Staff',
    'Senior Staff',
    'Supervisor',
    'Manager',
    'Director',
  ];

  final List<String> _workingHours = [
    '6 hours',
    '8 hours',
    '10 hours',
    '12 hours',
  ];

  final List<String> _workExperiences = [
    'Less than 1 year',
    '1-2 years',
    '3-5 years',
    '5+ years',
  ];

  final List<String> _provinces = [
    'Phnom Penh',
    'Siem Reap',
    'Battambang',
    'Kampong Cham',
    'Kandal',
  ];

  @override
  void dispose() {
    _companyNameController.dispose();
    _industryTypeController.dispose();
    _institutionPhoneController.dispose();
    _salaryController.dispose();
    _payrollViaController.dispose();
    _houseNumberController.dispose();
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
                          // Your Occupation Section
                          _buildOccupationSection(),
                          const SizedBox(height: 24),
                          
                          // Occupation Details Section
                          _buildOccupationDetailsSection(),
                          const SizedBox(height: 24),
                          
                          // Proof of Income Section
                          _buildProofOfIncomeSection(),
                          const SizedBox(height: 24),
                          
                          // Place of Work Section
                          _buildPlaceOfWorkSection(),
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
            'Occupation',
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
          _buildProgressLine(false),
          _buildProgressStep(3, 'Emergency contact\ninformation', false),
          _buildProgressLine(false),
          _buildProgressStep(4, 'Credit\ninformation', false),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    final isActive = step == _currentStep;
    
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

  Widget _buildOccupationSection() {
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
            'Your Occupation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Occupation',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 12),
          ..._occupationTypes.map((occupation) => _buildOccupationOption(occupation)),
        ],
      ),
    );
  }

  Widget _buildOccupationOption(String occupation) {
    final isSelected = _selectedOccupation == occupation;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedOccupation = occupation;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1953EA).withOpacity(0.1) : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF1953EA) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  occupation,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? const Color(0xFF1953EA) : const Color(0xFF4A5568),
                  ),
                ),
              ),
              Radio<String>(
                value: occupation,
                groupValue: _selectedOccupation,
                onChanged: (value) {
                  setState(() {
                    _selectedOccupation = value!;
                  });
                },
                activeColor: const Color(0xFF1953EA),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOccupationDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _selectedOccupation,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Company Name
          _buildFormField(
            label: 'company name',
            controller: _companyNameController,
            hint: 'company name',
          ),
          const SizedBox(height: 16),
          
          // Industry Type
          _buildFormField(
            label: 'Industry type',
            controller: _industryTypeController,
            hint: 'Industry type',
          ),
          const SizedBox(height: 16),
          
          // Institution Phone and Position Row
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: 'Institution Phone Number',
                  controller: _institutionPhoneController,
                  hint: 'Institution phone Number',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'Position',
                  value: _selectedPosition,
                  items: _positions,
                  hint: 'position',
                  onChanged: (value) {
                    setState(() {
                      _selectedPosition = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Salary and Salary Payment Date Row
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: 'Salary',
                  controller: _salaryController,
                  hint: 'Salary',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDateField(
                  label: 'Salary payment date',
                  selectedDate: _selectedSalaryPaymentDate,
                  hint: 'Salary payment date',
                  onDateSelected: (date) {
                    setState(() {
                      _selectedSalaryPaymentDate = date;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Payroll via
          _buildFormField(
            label: 'Payroll via',
            controller: _payrollViaController,
            hint: 'payroll via',
          ),
          const SizedBox(height: 16),
          
          // Current Working Hour
          _buildDropdownField(
            label: 'Current working hour',
            value: _selectedWorkingHour,
            items: _workingHours,
            hint: 'Current working hour',
            onChanged: (value) {
              setState(() {
                _selectedWorkingHour = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          
          // Work Experience
          _buildDropdownField(
            label: 'Work Experience',
            value: _selectedWorkExperience,
            items: _workExperiences,
            hint: 'Work experience',
            onChanged: (value) {
              setState(() {
                _selectedWorkExperience = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProofOfIncomeSection() {
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
            'Proof of in come / employment agreement',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _selectFile,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.insert_drive_file,
                      size: 32,
                      color: Color(0xFF1953EA),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Insert a photo, file',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOfWorkSection() {
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
            'Place of work / Occupation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // House Number / Street Number
          _buildFormField(
            label: 'House Number / Street Number',
            controller: _houseNumberController,
            hint: 'House Number / Street Number',
          ),
          const SizedBox(height: 16),
          
          // Province / City
          _buildDropdownField(
            label: 'Province / City',
            value: _selectedProvince,
            items: _provinces,
            hint: 'Province / City',
            onChanged: (value) {
              setState(() {
                _selectedProvince = value!;
              });
            },
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

  Widget _buildDateField({
    required String label,
    required DateTime? selectedDate,
    required String hint,
    required ValueChanged<DateTime> onDateSelected,
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
          onTap: () => _selectDate(onDateSelected),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate != null
                        ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                        : hint,
                    style: TextStyle(
                      color: selectedDate != null ? const Color(0xFF2D3748) : const Color(0xFFA0AEC0),
                      fontSize: 14,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Color(0xFFA0AEC0),
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

  void _selectDate(ValueChanged<DateTime> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void _selectFile() {
    // Implement file selection logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File selection feature will be implemented here')),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigate to next step or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Occupation form submitted successfully!')),
      );
      Navigator.pop(context);
    }
  }
}