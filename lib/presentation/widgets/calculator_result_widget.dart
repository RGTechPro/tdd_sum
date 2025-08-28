import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';

class CalculatorResultWidget extends StatelessWidget {
  const CalculatorResultWidget({super.key});

  String _formatErrorMessage(String error) {
    if (error.contains('Invalid radix-10 number') && error.contains('\\n')) {
      return 'Tip: Use actual Enter key instead of typing "\\n" literally.\n\nError: $error';
    }
    
    if (error.contains('Invalid radix-10 number')) {
      return 'Invalid number format. Check your delimiters.\n\nDetails: $error';
    }
    
    if (error.contains('negative numbers not allowed')) {
      return error; 
    }
    
    if (error.contains('Exception:')) {
      return error.replaceFirst('Exception: ', '');
    }
    
    return 'Error: $error';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.result.isEmpty && !viewModel.hasError) {
          return const SizedBox.shrink();
        }

        final isError = viewModel.hasError;
        final displayText = isError 
            ? _formatErrorMessage(viewModel.errorMessage ?? 'Unknown error')
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
