import 'package:flutter/material.dart';
import 'credit_information_form_page.dart';

class EmergencyContactFormPage extends StatefulWidget {
  final VoidCallback? onFormCompleted;
  
  const EmergencyContactFormPage({super.key, this.onFormCompleted});

  @override
  State<EmergencyContactFormPage> createState() => _EmergencyContactFormPageState();
}

class _EmergencyContactFormPageState extends State<EmergencyContactFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final _relativeInformationController = TextEditingController();
  final _relativePhoneController = TextEditingController();
  final _houseNumberController = TextEditingController();
  
  String _selectedContactMustBe = 'Father';
  String _selectedProvince = 'Phnom Penh';

  final List<String> _contactMustBeOptions = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Spouse',
    'Friend',
    'Colleague',
    'Other',
  ];

  final List<String> _provinceOptions = [
    'Phnom Penh',
    'Siem Reap',
    'Battambang',
    'Kampong Cham',
    'Kandal',
    'Kampong Speu',
    'Kampong Thom',
    'Kratie',
    'Mondulkiri',
    'Oddar Meanchey',
    'Pailin',
    'Preah Sihanouk',
    'Preah Vihear',
    'Pursat',
    'Ratanakiri',
    'Sihanoukville',
    'Stung Treng',
    'Svay Rieng',
    'Takeo',
    'Tboung Khmum',
    'Banteay Meanchey',
    'Chumphon',
    'Kep',
    'Koh Kong',
    'Rovieng',
  ];

  @override
  void dispose() {
    _relativeInformationController.dispose();
    _relativePhoneController.dispose();
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
                          // Emergency Contact Information Section
                          _buildEmergencyContactSection(),
                          const SizedBox(height: 24),
                          
                          // Relative Address Section
                          _buildRelativeAddressSection(),
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
            'Emergency Contact',
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
          _buildProgressStep(3, 'Emergency contact', true),
          _buildProgressLine(false),
          _buildProgressStep(4, 'Credit\ninformation', false),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    final isActive = step == 3; // Emergency contact is step 3
    
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

  Widget _buildEmergencyContactSection() {
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
            'Emergency Contact',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Relative information
          _buildFormField(
            label: 'Relative information',
            controller: _relativeInformationController,
            hint: 'Relative information',
          ),
          const SizedBox(height: 16),
          
          // Relative phone number
          _buildFormField(
            label: 'Relative phone number',
            controller: _relativePhoneController,
            hint: 'Relative phone number',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          
          // Contact must be
          _buildDropdownField(
            label: 'Contact must be',
            value: _selectedContactMustBe,
            items: _contactMustBeOptions,
            hint: 'Contact must be',
            onChanged: (value) {
              setState(() {
                _selectedContactMustBe = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRelativeAddressSection() {
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
            'Relative Address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // House number
          _buildFormField(
            label: 'House number',
            controller: _houseNumberController,
            hint: 'House number/street number',
          ),
          const SizedBox(height: 16),
          
          // Province / City
          _buildDropdownField(
            label: 'Province / City',
            value: _selectedProvince,
            items: _provinceOptions,
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Emergency Contact submitted successfully!')),
      );
      widget.onFormCompleted?.call();
      
      // Navigate to next step (Credit Information Form) - Step 4
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CreditInformationFormPage(
            onFormCompleted: widget.onFormCompleted,
          ),
        ),
      );
    }
  }
}