import 'package:flutter/material.dart';
import 'dart:math';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class LoanCalculatorPage extends StatefulWidget {
  const LoanCalculatorPage({super.key});

  @override
  State<LoanCalculatorPage> createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  final _loanAmountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _loanTermController = TextEditingController();
  
  double _monthlyPayment = 0.0;
  double _totalInterest = 0.0;
  double _totalPayment = 0.0;
  
  String _selectedLoanType = 'Personal Loan';
  
  final List<Map<String, dynamic>> _loanTypes = [
    {'name': 'Personal Loan', 'rate': 12.5},
    {'name': 'Business Loan', 'rate': 10.0},
    {'name': 'Education Loan', 'rate': 8.5},
    {'name': 'Home Loan', 'rate': 6.0},
    {'name': 'Car Loan', 'rate': 7.5},
  ];

  @override
  void initState() {
    super.initState();
    _interestRateController.text = '12.5';
  }

  @override
  void dispose() {
    _loanAmountController.dispose();
    _interestRateController.dispose();
    _loanTermController.dispose();
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
                          'Loan Calculator',
                          style: AppFonts.pageTitle.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Calculate your monthly payments and total interest',
                          style: AppFonts.bodyText.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // Calculator Form
                        _buildCalculatorForm(),
                        const SizedBox(height: 24),
                        
                        // Results
                        if (_monthlyPayment > 0) ...[
                          _buildResults(),
                          const SizedBox(height: 24),
                        ],
                        
                        // Loan Information
                        _buildLoanInfo(),
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
            'Loan Calculator',
            style: AppFonts.appBarTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loan Type Selection
        Text(
          'Loan Type',
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedLoanType,
          items: _loanTypes.map((loan) {
            return DropdownMenuItem<String>(
              value: loan['name'],
              child: Text('${loan['name']} (${loan['rate']}% APR)'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedLoanType = value!;
              final selectedLoan = _loanTypes.firstWhere((loan) => loan['name'] == value);
              _interestRateController.text = selectedLoan['rate'].toString();
            });
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.category, color: AppColors.primaryBlue),
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
        
        const SizedBox(height: 16),
        
        // Loan Amount
        Text(
          'Loan Amount (USD)',
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _loanAmountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter loan amount',
            prefixIcon: const Icon(Icons.monetization_on, color: AppColors.primaryBlue),
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
        
        const SizedBox(height: 16),
        
        // Interest Rate
        Text(
          'Annual Interest Rate (%)',
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _interestRateController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter interest rate',
            prefixIcon: const Icon(Icons.percent, color: AppColors.primaryBlue),
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
        
        const SizedBox(height: 16),
        
        // Loan Term
        Text(
          'Loan Term (Years)',
          style: AppFonts.fieldLabel.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _loanTermController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter loan term in years',
            prefixIcon: const Icon(Icons.schedule, color: AppColors.primaryBlue),
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
        
        const SizedBox(height: 24),
        
        // Calculate Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _calculateLoan,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
            ),
            child: Text(
              'Calculate',
              style: AppFonts.buttonText.copyWith(
                color: AppColors.textLight,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResults() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.secondaryGradient,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calculation Results',
            style: AppFonts.sectionTitle.copyWith(
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 20),
          
          _buildResultItem('Monthly Payment', '\$${_monthlyPayment.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          _buildResultItem('Total Interest', '\$${_totalInterest.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          _buildResultItem('Total Payment', '\$${_totalPayment.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppFonts.bodyText.copyWith(
            color: AppColors.textLight,
          ),
        ),
        Text(
          value,
          style: AppFonts.bodyText.copyWith(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildLoanInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loan Information',
          style: AppFonts.sectionTitle.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        ..._loanTypes.map((loan) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: loan['name'] == _selectedLoanType 
                  ? AppColors.primaryBlue 
                  : AppColors.borderLight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getLoanIcon(loan['name']),
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loan['name'],
                      style: AppFonts.cardTitle.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Interest Rate: ${loan['rate']}% APR',
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (loan['name'] == _selectedLoanType)
                Icon(
                  Icons.check_circle,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
            ],
          ),
        )),
      ],
    );
  }

  IconData _getLoanIcon(String loanType) {
    switch (loanType) {
      case 'Personal Loan':
        return Icons.person;
      case 'Business Loan':
        return Icons.business;
      case 'Education Loan':
        return Icons.school;
      case 'Home Loan':
        return Icons.home;
      case 'Car Loan':
        return Icons.directions_car;
      default:
        return Icons.monetization_on;
    }
  }

  void _calculateLoan() {
    if (_loanAmountController.text.isEmpty ||
        _interestRateController.text.isEmpty ||
        _loanTermController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: AppColors.accentRed,
        ),
      );
      return;
    }

    final principal = double.tryParse(_loanAmountController.text) ?? 0;
    final annualRate = double.tryParse(_interestRateController.text) ?? 0;
    final years = double.tryParse(_loanTermController.text) ?? 0;

    if (principal <= 0 || annualRate <= 0 || years <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid positive numbers'),
          backgroundColor: AppColors.accentRed,
        ),
      );
      return;
    }

    // Calculate monthly payment using formula: M = P * [r(1+r)^n] / [(1+r)^n - 1]
    final monthlyRate = annualRate / 100 / 12;
    final numberOfPayments = years * 12;
    
    final monthlyPayment = principal * 
        (monthlyRate * pow(1 + monthlyRate, numberOfPayments)) /
        (pow(1 + monthlyRate, numberOfPayments) - 1);
    
    final totalPayment = monthlyPayment * numberOfPayments;
    final totalInterest = totalPayment - principal;

    setState(() {
      _monthlyPayment = monthlyPayment;
      _totalInterest = totalInterest;
      _totalPayment = totalPayment;
    });
  }
}