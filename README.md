# String Calculator TDD Assignment

This is my solution for the String Calculator kata assignment. Built it with Flutter using proper TDD approach and clean architecture patterns.

## **MAIN Calculator TDD LOGIC IS IN:** [`lib/domain/services/string_calculator.dart`](lib/domain/services/string_calculator.dart) All tests in [`test/string_calculator_test.dart`](test/string_calculator_test.dart) drive this implementation.

## What it does

Takes a string with numbers and adds them up. Started simple with comma-separated values but ended up supporting pretty much any delimiter format you can think of.

Input examples:

- `1,2,3` (basic comma)
- `1\n2\n3` (newlines)
- `//;\n1;2;3` (custom delimiter)
- `//[***]\n1***2***3` (multi-character)
- `//[*][%]\n1*2%3` (multiple delimiters)

## Project Structure

Organized using clean architecture principles:

```
lib/
├── main.dart                               # App bootstrap
├── domain/
│   ├── entities/
│   │   └── calculation_result.dart         # Business models
│   ├── services/
│   │   ├── string_calculator.dart          #  CORE TDD LOGIC HERE 
│   │   └── error_message_formatter.dart    # Error formatting
│   └── use_cases/
│       └── calculate_numbers_use_case.dart # Business rules
└── presentation/
    ├── viewmodels/
    │   └── calculator_viewmodel.dart        # State management (no setState!)
    ├── pages/
    │   └── calculator_page.dart             # Main screen
    └── widgets/
        ├── calculator_input_widget.dart     # Input component
        └── calculator_result_widget.dart    # Result display

test/
├── string_calculator_test.dart             # Unit tests
└── widget_test.dart                        # Widget tests
```

Used Provider for dependency injection and ViewModel pattern instead of setState for cleaner state management.

## Features

- Empty string returns 0
- Handles unlimited numbers
- Multiple delimiter support
- Custom delimiter syntax
- Multi-character delimiters
- Multiple delimiters in one input
- Validates against negative numbers
- Ignores numbers > 1000
- Real-time UI for testing

## Setup

Get dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

## Testing

All tests:

```bash
flutter test
```

With coverage:

```bash
flutter test --coverage
```

## Development Approach

Followed TDD strictly - wrote failing tests first, made them pass with minimal code, then refactored. Each feature went through the red-green-refactor cycle.

** IMPORTANT: The core TDD implementation is in `lib/domain/services/string_calculator.dart` - this is where all the main kata logic lives!** All tests in `test/string_calculator_test.dart` drive this implementation.

The clean architecture separation means:

- Domain layer has no dependencies on UI or external frameworks
- Presentation layer only handles UI concerns
- Business logic is completely testable in isolation
- Error formatting logic lives in domain, not UI

## UI Features

Added a Flutter interface for easier testing. You can type different number formats and see results instantly. Error messages are formatted to be user-friendly while still showing technical details when needed.

Example inputs to try:

- `1,2,3` → Result: 6
- `//;\n1;2;3` → Result: 6
- `//[***]\n1***2***3` → Result: 6
- `//[*][%]\n1*2%3` → Result: 6
- `1,-2` → Error: negative numbers not allowed
