import '../entities/calculation_result.dart';
import '../../service/string_calculator.dart';

class CalculateNumbersUseCase {
  final StringCalculator _calculator;

  CalculateNumbersUseCase(this._calculator);

  CalculationResult execute(String input) {
    try {
      final result = _calculator.add(input);
      return CalculationResult.success(result);
    } catch (e) {
      return CalculationResult.error(e.toString());
    }
  }
}
