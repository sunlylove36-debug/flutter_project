import 'package:flutter/foundation.dart';

class FormService extends ChangeNotifier {
  final Set<String> _completedForms = {};

  Set<String> get completedForms => _completedForms;

  bool isFormCompleted(String formId) {
    return _completedForms.contains(formId);
  }

  void markFormCompleted(String formId) {
    _completedForms.add(formId);
    notifyListeners();
  }

  void markFormIncomplete(String formId) {
    _completedForms.remove(formId);
    notifyListeners();
  }

  void clearAllCompletions() {
    _completedForms.clear();
    notifyListeners();
  }

  int get completedFormsCount => _completedForms.length;
  
  double get completionPercentage => _completedForms.length / 4.0; // 4 total forms
}