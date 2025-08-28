class ErrorMessageFormatter {
  static String format(String error) {
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
}
