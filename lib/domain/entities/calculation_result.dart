class CalculationResult {
  final int value;
  final bool isError;
  final String? errorMessage;

  const CalculationResult._({
    required this.value,
    required this.isError,
    this.errorMessage,
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
    );
  }
}
