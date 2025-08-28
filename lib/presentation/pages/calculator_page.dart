import 'package:flutter/material.dart';
import '../widgets/calculator_input_widget.dart';
import '../widgets/calculator_result_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CalculatorInputWidget(),
            SizedBox(height: 24),
            CalculatorResultWidget(),
          ],
        ),
      ),
    );
  }
}
