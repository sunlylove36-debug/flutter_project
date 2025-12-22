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
  
  // Date fields
  DateTime? _selectedDateline;
  DateTime? _selectedBirthDate;
  
  // Dropdown selections
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

  // Dropdown options
  static const List<String> _genderOptions = ['Male', 'Female', 'Other'];
  static const List<String> _familyStatusOptions = ['Single', 'Married', 'Divorced', 'Widowed'];
  static const List<String> _educationOptions = ['High School', 'Bachelor', 'Master', 'PhD'];
  static const List<String> _personalPropertyOptions = ['Own House', 'Rent', 'Family House', 'Other'];
  static const List<String> _provinceOptions = [
    'Phnom Penh', 'Siem Reap', 'Battambang', 'Kampong Cham', 'Kandal',
    'Kampong Speu', 'Kampong Thom', 'Kratie', 'Mondulkiri', 'Oddar Meanchey',
    'Pailin', 'Preah Sihanouk', 'Preah Vihear', 'Pursat', 'Ratanakiri',
    'Sihanoukville', 'Stung Treng', 'Svay Rieng', 'Takeo', 'Tboung Khmum',
    'Banteay Meanchey', 'Chumphon', 'Kep', 'Koh Kong', 'Rovieng',
  ];
  static const List<String> _ownerOptions = ['Self', 'Family', 'Landlord', 'Other'];
  static const List<String> _stayWithOptions = ['Family', 'Alone', 'Friends', 'Roommate'];
  static const List<String> _durationOptions = ['Less than 1 year', '1-2 years', '3-5 years', '5+ years'];
  static const List<String> _socialMediaOptions = ['Facebook', 'Instagram', 'Twitter', 'LinkedIn', 'TikTok'];

  // Constants
  static const _primaryColor = Color(0xFF1953EA);
  static const _backgroundColor = Color(0xFFF5F5F5);
  static const _textPrimary = Color(0xFF2D3748);
  static const _textSecondary = Color(0xFF4A5568);
  static const _textHint = Color(0xFFA0AEC0);
  static const _borderColor = Color(0xFFE2E8F0);

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
            colors: [_primaryColor, _primaryColor],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildAppBar(),
              _buildProgressIndicator(),
              Expanded(
                child: _buildFormContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
    return Padding(
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

  Widget _buildProgressStep(int step, String label, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$step',
                style: TextStyle(
                  color: isActive ? _primaryColor : Colors.grey,
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

  Widget _buildFormContent() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildYourProfileSection(),
              const SizedBox(height: 24),
              _buildCurrentAddressSection(),
              const SizedBox(height: 24),
              _buildPlaceOfBirthSection(),
              const SizedBox(height: 24),
              _buildSocialMediaSection(),
              const SizedBox(height: 24),
              _buildScanningSection(),
              const SizedBox(height: 32),
              _buildNextButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildYourProfileSection() {
    return _buildSectionCard(
      title: 'Your Profile',
      children: [
        _buildTextField(
          label: 'ID Card Number',
          controller: _idCardController,
          hint: 'Enter ID Card Number',
        ),
        const SizedBox(height: 16),
        _buildDateField(
          label: 'Dateline',
          selectedDate: _selectedDateline,
          hint: 'Select dateline',
          onDateSelected: (date) => setState(() => _selectedDateline = date),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: 'Phone Number',
          controller: _phoneController,
          hint: 'Enter phone number',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                label: 'Last name',
                controller: _lastNameController,
                hint: 'Enter last name',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                label: 'Name',
                controller: _nameController,
                hint: 'Enter name',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDateField(
                label: 'Date of birth',
                selectedDate: _selectedBirthDate,
                hint: 'Select birth date',
                onDateSelected: (date) => setState(() => _selectedBirthDate = date),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdown(
                label: 'Gender',
                value: _selectedGender,
                items: _genderOptions,
                onChanged: (value) => setState(() => _selectedGender = value!),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                label: 'Family status',
                value: _selectedFamilyStatus,
                items: _familyStatusOptions,
                onChanged: (value) => setState(() => _selectedFamilyStatus = value!),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdown(
                label: 'Education',
                value: _selectedEducation,
                items: _educationOptions,
                onChanged: (value) => setState(() => _selectedEducation = value!),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDropdown(
          label: 'Personal property',
          value: _selectedPersonalProperty,
          items: _personalPropertyOptions,
          onChanged: (value) => setState(() => _selectedPersonalProperty = value!),
        ),
      ],
    );
  }

  Widget _buildCurrentAddressSection() {
    return _buildSectionCard(
      title: 'Current Address',
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                label: 'Home Number',
                controller: _homeNumberController,
                hint: 'Enter home number',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                label: 'Street Number',
                controller: _streetNumberController,
                hint: 'Enter street number',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDropdown(
          label: 'Province / City',
          value: _selectedProvince,
          items: _provinceOptions,
          onChanged: (value) => setState(() => _selectedProvince = value!),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                label: 'Owner',
                value: _selectedOwner,
                items: _ownerOptions,
                onChanged: (value) => setState(() => _selectedOwner = value!),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdown(
                label: 'Stay with',
                value: _selectedStayWith,
                items: _stayWithOptions,
                onChanged: (value) => setState(() => _selectedStayWith = value!),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDropdown(
          label: 'Duration of stay',
          value: _selectedDurationOfStay,
          items: _durationOptions,
          onChanged: (value) => setState(() => _selectedDurationOfStay = value!),
        ),
      ],
    );
  }

  Widget _buildPlaceOfBirthSection() {
    return _buildSectionCard(
      title: 'Place of birth',
      children: [
        _buildDropdown(
          label: 'Province / City',
          value: _selectedPlaceOfBirth,
          items: _provinceOptions,
          onChanged: (value) => setState(() => _selectedPlaceOfBirth = value!),
        ),
      ],
    );
  }

  Widget _buildSocialMediaSection() {
    return _buildSectionCard(
      title: 'Social Media',
      children: [
        _buildDropdown(
          label: 'Platform',
          value: _selectedSocialMedia,
          items: _socialMediaOptions,
          onChanged: (value) => setState(() => _selectedSocialMedia = value!),
        ),
      ],
    );
  }

  Widget _buildScanningSection() {
    return _buildSectionCard(
      title: 'Scanning your identity card and selfie',
      children: [
        const Text(
          'Click on the upload',
          style: TextStyle(
            fontSize: 14,
            color: _primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildUploadBox(
                icon: Icons.credit_card,
                label: 'Identity',
                onTap: _handleIdentityUpload,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildUploadBox(
                icon: Icons.image,
                label: 'Selfie',
                onTap: _handleSelfieUpload,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadBox({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: _primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: _textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
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
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: _textHint, fontSize: 14),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _primaryColor, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          autovalidateMode: AutovalidateMode.disabled,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
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
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showDropdownModal(label, items, value, onChanged),
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
                    value,
                    style: const TextStyle(fontSize: 14, color: _textPrimary),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Color(0xFF9CA3AF)),
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
            color: _textPrimary,
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
                      color: selectedDate != null ? _textPrimary : _textHint,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Icon(Icons.calendar_today, size: 16, color: _textHint),
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
        onPressed: _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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

  void _showDropdownModal(
    String title,
    List<String> items,
    String currentValue,
    ValueChanged<String?> onChanged,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary,
                ),
              ),
            ),
            const Divider(height: 1, color: _borderColor),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = item == currentValue;
                  return GestureDetector(
                    onTap: () {
                      onChanged(item);
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: isSelected ? const Color(0xFFF3F4F6) : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: _textPrimary,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(Icons.check, color: _primaryColor, size: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(ValueChanged<DateTime> onDateSelected) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void _handleIdentityUpload() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Identity document upload will be implemented'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleSelfieUpload() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Selfie upload will be implemented'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleSubmit() {
    widget.onFormCompleted?.call();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile form submitted successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    
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