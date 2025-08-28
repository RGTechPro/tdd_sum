import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final String output;
  final bool isError;

  const ResultWidget({
    super.key,
    required this.output,
    required this.isError,
  });

  String _processErrorMessage(String error) {
    if (error.contains('Invalid radix-10 number') && error.contains('\\n')) {
      return '💡 Tip: Use actual Enter key instead of typing "\\n" literally.\n\nOriginal error: $error';
    }
    
    if (error.contains('Invalid radix-10 number')) {
      return '❌ Invalid number format. Check your delimiters and number format.\n\nDetails: $error';
    }
    
    if (error.contains('negative numbers not allowed')) {
      return '❌ $error'; 
    }
    
    if (error.contains('Exception:')) {
      return error.replaceFirst('Exception: ', '❌ ');
    }
    
    if (error.contains('FormatException:')) {
      return '❌ Number format error: Please check your input format.\n\nDetails: ${error.replaceFirst('FormatException: ', '')}';
    }
    
    return '❌ Error: $error';
  }

  @override
  Widget build(BuildContext context) {
    if (output.isEmpty) {
      return const SizedBox.shrink();
    }

    final displayText = isError ? _processErrorMessage(output) : output;

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
                fontWeight: FontWeight.bold,
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
  }
}
