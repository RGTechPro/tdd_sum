class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    
    final (delimiters, numbersString) = _parseDelimiters(numbers);
    
    final numberStrings = _splitByDelimiters(numbersString, delimiters);
    
    final parsedNumbers = numberStrings.map(int.parse).toList();
    _validateNegatives(parsedNumbers);
    
    return parsedNumbers.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);
  }
  
  (List<String>, String) _parseDelimiters(String input) {
    if (!input.startsWith('//')) {
      return ([','], input);
    }
    
    final newlineIndex = input.indexOf('\n');
    final delimiterSection = input.substring(2, newlineIndex);
    final numbersString = input.substring(newlineIndex + 1);
    
    return switch (delimiterSection) {
      // Multiple delimiters with brackets: [del1][del2]...
      String section when section.contains('[') => (
        _extractBracketedDelimiters(section),
        numbersString
      ),
      String singleDelim => ([singleDelim], numbersString),
    };
  }
  
  List<String> _extractBracketedDelimiters(String section) {
    final delimiters = <String>[];
    final regex = RegExp(r'\[([^\]]*)\]');
    
    for (final match in regex.allMatches(section)) {
      final delimiter = match.group(1) ?? '';
      if (delimiter.isNotEmpty) {
        delimiters.add(delimiter);
      }
    }
    
    return delimiters.isEmpty ? [','] : delimiters;
  }
  
  List<String> _splitByDelimiters(String text, List<String> delimiters) {
    String result = text.replaceAll('\n', delimiters[0]);
    
    // Replace all other delimiters with the first one for uniform splitting
    for (int i = 1; i < delimiters.length; i++) {
      result = result.replaceAll(delimiters[i], delimiters[0]);
    }
    
    return result.split(delimiters[0]);
  }
  
  void _validateNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }
  }
}
