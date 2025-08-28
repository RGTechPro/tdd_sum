import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/services/string_calculator.dart';
import 'domain/use_cases/calculate_numbers_use_case.dart';
import 'presentation/viewmodels/calculator_viewmodel.dart';
import 'presentation/pages/calculator_page.dart';

void main() {
  runApp(const StringCalculatorApp());
}

class StringCalculatorApp extends StatelessWidget {
  const StringCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculatorViewModel(
            CalculateNumbersUseCase(StringCalculator()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'String Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const CalculatorPage(),
      ),
    );
  }
}
