import '../services/error_message_formatter.dart';

class CalculationResult {
  final int value;
  final bool isError;
  final String? errorMessage;
  final String? formattedErrorMessage;

  const CalculationResult._({
    required this.value,
    required this.isError,
    this.errorMessage,
    this.formattedErrorMessage,
  });

  factory CalculationResult.success(int value) {
    return CalculationResult._(
      value: value,
      isError: false,
    );
  }

  factory CalculationResult.error(String message) {
    return CalculationResult._(
      value: 0,
      isError: true,
      errorMessage: message,
      formattedErrorMessage: ErrorMessageFormatter.format(message),
    );
  }
}
