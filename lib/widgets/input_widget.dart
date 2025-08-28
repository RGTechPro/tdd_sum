import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const InputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Input:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 4,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Examples:\n1,2,3\n//;\n1;2;3\n//[***]\n1***2***3',
            helperText: '💡 Tip: Press Enter for newlines, don\'t type \\n literally',
            helperMaxLines: 2,
          ),
          onChanged: onChanged,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.clear),
              label: const Text('Clear'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                '✨ Supports: comma, newline, custom delimiters (//;), multi-char ([***]), multiple delimiters ([*][%])',
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
  }
}
