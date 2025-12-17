import 'package:flutter/material.dart';
import 'occupation_form_page.dart';

class ProfileIdentityFormPage extends StatefulWidget {
  final VoidCallback? onFormCompleted;
  
  const ProfileIdentityFormPage({super.key, this.onFormCompleted});

  @override
  State<ProfileIdentityFormPage> createState() => _ProfileIdentityFormPageState();
}

class _ProfileIdentityFormPageState extends State<ProfileIdentityFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final _idCardController = TextEditingController();
  final _phoneController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _homeNumberController = TextEditingController();
  final _streetNumberController = TextEditingController();
  
  DateTime? _selectedDateline;
  DateTime? _selectedBirthDate;
  String _selectedGender = 'Male';
  String _selectedFamilyStatus = 'Single';
  String _selectedEducation = 'Bachelor';
  String _selectedPersonalProperty = 'Own House';
  String _selectedProvince = 'Phnom Penh';
  String _selectedOwner = 'Self';
  String _selectedStayWith = 'Family';
  String _selectedDurationOfStay = '1-2 years';
  String _selectedPlaceOfBirth = 'Phnom Penh';
  String _selectedSocialMedia = 'Facebook';

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final List<String> _familyStatusOptions = ['Single', 'Married', 'Divorced', 'Widowed'];
  final List<String> _educationOptions = ['High School', 'Bachelor', 'Master', 'PhD'];
  final List<String> _personalPropertyOptions = ['Own House', 'Rent', 'Family House', 'Other'];
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
  final List<String> _ownerOptions = ['Self', 'Family', 'Landlord', 'Other'];
  final List<String> _stayWithOptions = ['Family', 'Alone', 'Friends', 'Roommate'];
  final List<String> _durationOptions = ['Less than 1 year', '1-2 years', '3-5 years', '5+ years'];
  final List<String> _socialMediaOptions = ['Facebook', 'Instagram', 'Twitter', 'LinkedIn', 'TikTok'];

  @override
  void dispose() {
    _idCardController.dispose();
    _phoneController.dispose();
    _lastNameController.dispose();
    _nameController.dispose();
    _homeNumberController.dispose();
    _streetNumberController.dispose();
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
                          // Your Profile Section
                          _buildYourProfileSection(),
                          const SizedBox(height: 24),
                          
                          // Current Address Section
                          _buildCurrentAddressSection(),
                          const SizedBox(height: 24),
                          
                          // Place of Birth Section
                          _buildPlaceOfBirthSection(),
                          const SizedBox(height: 24),
                          
                          // Social Media Section
                          _buildSocialMediaSection(),
                          const SizedBox(height: 24),
                          
                          // Scanning Section
                          _buildScanningSection(),
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
            'Profile \\ Identity',
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
          _buildProgressLine(false),
          _buildProgressStep(2, 'Occupation', false),
          _buildProgressLine(false),
          _buildProgressStep(3, 'Emergency contact\ninformation', false),
          _buildProgressLine(false),
          _buildProgressStep(4, 'Credit\ninformation', false),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    final isActive = step == 1; // Profile/Identity is active
    
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

  Widget _buildYourProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // ID Card Number
          _buildFormField(
            label: 'ID Card Number',
            controller: _idCardController,
            hint: 'ID Card Number',
          ),
          const SizedBox(height: 16),
          
          // Dateline
          _buildDateField(
            label: 'Dateline',
            selectedDate: _selectedDateline,
            hint: 'Dateline',
            onDateSelected: (date) {
              setState(() {
                _selectedDateline = date;
              });
            },
          ),
          const SizedBox(height: 16),
          
          // Phone Number
          _buildFormField(
            label: 'Phone Number',
            controller: _phoneController,
            hint: 'Phone Number',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          
          // Last name and Name Row
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: 'Last name',
                  controller: _lastNameController,
                  hint: 'Last name',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildFormField(
                  label: 'Name',
                  controller: _nameController,
                  hint: 'Name',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Date of birth and Gender Row
          Row(
            children: [
              Expanded(
                child: _buildDateField(
                  label: 'Date of birth',
                  selectedDate: _selectedBirthDate,
                  hint: 'Birth of date',
                  onDateSelected: (date) {
                    setState(() {
                      _selectedBirthDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'Gender',
                  value: _selectedGender,
                  items: _genderOptions,
                  hint: 'Gender',
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Family status and Education Row
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  label: 'Family status',
                  value: _selectedFamilyStatus,
                  items: _familyStatusOptions,
                  hint: 'Family status',
                  onChanged: (value) {
                    setState(() {
                      _selectedFamilyStatus = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'Education',
                  value: _selectedEducation,
                  items: _educationOptions,
                  hint: 'Education',
                  onChanged: (value) {
                    setState(() {
                      _selectedEducation = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Personal property
          _buildDropdownField(
            label: 'Personal property',
            value: _selectedPersonalProperty,
            items: _personalPropertyOptions,
            hint: 'Personal property',
            onChanged: (value) {
              setState(() {
                _selectedPersonalProperty = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentAddressSection() {
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
            'Current Address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Home Number and Street Number Row
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: 'Home Number',
                  controller: _homeNumberController,
                  hint: 'Home Number',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildFormField(
                  label: 'Street Number',
                  controller: _streetNumberController,
                  hint: 'Street Number',
                ),
              ),
            ],
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
          const SizedBox(height: 16),
          
          // Owner and Stay with Row
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  label: 'Owner',
                  value: _selectedOwner,
                  items: _ownerOptions,
                  hint: 'Owner',
                  onChanged: (value) {
                    setState(() {
                      _selectedOwner = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'Stay with',
                  value: _selectedStayWith,
                  items: _stayWithOptions,
                  hint: 'Stay with',
                  onChanged: (value) {
                    setState(() {
                      _selectedStayWith = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Duration of stay
          _buildDropdownField(
            label: 'Duration of stay',
            value: _selectedDurationOfStay,
            items: _durationOptions,
            hint: 'Duration of stay',
            onChanged: (value) {
              setState(() {
                _selectedDurationOfStay = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOfBirthSection() {
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
            'Place of birth',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Province / City
          _buildDropdownField(
            label: 'Province / City',
            value: _selectedPlaceOfBirth,
            items: _provinceOptions,
            hint: 'Province / City',
            onChanged: (value) {
              setState(() {
                _selectedPlaceOfBirth = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaSection() {
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
            'Social Media',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          
          // Social Media Platform
          _buildDropdownField(
            label: 'Province / City',
            value: _selectedSocialMedia,
            items: _socialMediaOptions,
            hint: 'Province / City',
            onChanged: (value) {
              setState(() {
                _selectedSocialMedia = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScanningSection() {
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
            'Scanning your identity card and selfie',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Click on the upload',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1953EA),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            children: [
              // Identity Upload
              Expanded(
                child: GestureDetector(
                  onTap: _selectIdentityDocument,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF1953EA),
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 32,
                          color: Color(0xFF9CA3AF),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Identity',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4A5568),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Selfie Upload
              Expanded(
                child: GestureDetector(
                  onTap: _selectSelfie,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF1953EA),
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 32,
                          color: Color(0xFF9CA3AF),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Selfie',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4A5568),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void _selectIdentityDocument() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Identity document upload feature will be implemented here')),
    );
  }

  void _selectSelfie() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selfie upload feature will be implemented here')),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile form submitted successfully!')),
      );
      widget.onFormCompleted?.call();
      
      // Navigate to next step (Occupation Form) - Step 2
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OccupationFormPage(
            onFormCompleted: widget.onFormCompleted,
          ),
        ),
      );
    }
  }
}