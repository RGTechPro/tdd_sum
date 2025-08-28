import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';

class CalculatorResultWidget extends StatelessWidget {
  const CalculatorResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.result.isEmpty && !viewModel.hasError) {
          return const SizedBox.shrink();
        }

        final isError = viewModel.hasError;
        final displayText = isError 
            ? (viewModel.formattedErrorMessage ?? 'Unknown error')
            : viewModel.result;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isError ? Icons.error_outline : Icons.check_circle_outline,
                  color: isError ? Colors.red : Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  isError ? 'Error' : 'Result',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isError ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isError ? Colors.red.shade50 : Colors.green.shade50,
                border: Border.all(
                  color: isError ? Colors.red : Colors.green,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                displayText,
                style: TextStyle(
                  fontSize: isError ? 14 : 24,
                  fontWeight: isError ? FontWeight.normal : FontWeight.bold,
                  color: isError ? Colors.red.shade700 : Colors.green.shade700,
                  fontFamily: isError ? null : 'monospace',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
