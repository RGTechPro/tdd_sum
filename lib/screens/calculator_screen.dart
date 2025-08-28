import 'package:flutter/material.dart';
import '../service/string_calculator.dart';
import '../widgets/input_widget.dart';
import '../widgets/result_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  final StringCalculator _calculator = StringCalculator();
  String _output = '';
  bool _isError = false;

  void _onInputChanged(String input) {
    setState(() {
      try {
        final result = _calculator.add(input);
        _output = result.toString();
        _isError = false;
      } catch (e) {
        // Keep the full error message for better processing in ResultWidget
        _output = e.toString();
        _isError = true;
      }
    });
  }

  void _clear() {
    setState(() {
      _controller.clear();
      _output = '';
      _isError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InputWidget(
              controller: _controller,
              onChanged: _onInputChanged,
              onClear: _clear,
            ),
            const SizedBox(height: 20),
            ResultWidget(
              output: _output,
              isError: _isError,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
