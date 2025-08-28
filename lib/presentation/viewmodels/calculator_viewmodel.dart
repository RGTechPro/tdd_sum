import 'package:flutter/foundation.dart';
import '../../domain/use_cases/calculate_numbers_use_case.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculateNumbersUseCase _calculateNumbersUseCase;

  CalculatorViewModel(this._calculateNumbersUseCase);

  String _inputText = '';
  String _result = '';
  bool _hasError = false;
  String? _errorMessage;

  // Getters
  String get inputText => _inputText;
  String get result => _result;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage;

  void updateInput(String input) {
    _inputText = input;
    _calculateResult();
    notifyListeners();
  }

  void clearInput() {
    _inputText = '';
    _result = '';
    _hasError = false;
    _errorMessage = null;
    notifyListeners();
  }

  void _calculateResult() {
    if (_inputText.isEmpty) {
      _result = '';
      _hasError = false;
      _errorMessage = null;
      return;
    }

    final calculationResult = _calculateNumbersUseCase.execute(_inputText);

    if (calculationResult.isError) {
      _hasError = true;
      _errorMessage = calculationResult.errorMessage;
      _result = '';
    } else {
      _hasError = false;
      _errorMessage = null;
      _result = calculationResult.value.toString();
    }
  }
}
