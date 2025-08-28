import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';

class CalculatorInputWidget extends StatelessWidget {
  const CalculatorInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Input Numbers:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Examples:\n1,2,3\n//;\n1;2;3\n//[***]\n1***2***3',
                helperText: 'Tip: Use actual newlines, not \\n',
                helperMaxLines: 2,
              ),
              onChanged: viewModel.updateInput,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: viewModel.clearInput,
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Supports: comma, newline, custom delimiters, multi-char delims',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
