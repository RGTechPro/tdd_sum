import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service/string_calculator.dart';
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
        Provider<StringCalculator>(
          create: (_) => StringCalculator(),
        ),
        ProxyProvider<StringCalculator, CalculateNumbersUseCase>(
          update: (_, calculator, __) => CalculateNumbersUseCase(calculator),
        ),
        ChangeNotifierProxyProvider<CalculateNumbersUseCase, CalculatorViewModel>(
          create: (context) => CalculatorViewModel(
            Provider.of<CalculateNumbersUseCase>(context, listen: false),
          ),
          update: (_, useCase, __) => CalculatorViewModel(useCase),
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