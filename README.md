# String Calculator TDD Assignment

This is my solution for the String Calculator kata assignment. Built it with Flutter using proper TDD approach and clean architecture patterns.

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
│   │   ├── string_calculator.dart          # Core calculation logic
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

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE like VS Code or Android Studio

### Installation

1. Clone this repository:

```bash
git clone <your-repo-url>
cd tdd_sum
```

2. Get the dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Running Tests

The project includes comprehensive unit tests following TDD methodology. To run all tests:

```bash
flutter test
```

For verbose output:

```bash
flutter test --verbose
```

To run tests with coverage:

```bash
flutter test --coverage
```

The test file is located at `test/string_calculator_test.dart` and covers all the calculator functionality including edge cases.

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── service/
│   └── string_calculator.dart # Core calculator logic
├── screens/
│   └── calculator_screen.dart # Main UI screen
└── widgets/
    ├── input_widget.dart     # Text input component
    └── result_widget.dart    # Result display component

test/
└── string_calculator_test.dart # Unit tests
```

## Using the UI

I added a Flutter UI so you can test the calculator interactively (figured it would be more useful than just unit tests):

1. **Input Field**: Type your numbers with whatever delimiters you want
2. **Live Results**: Updates as you type
3. **Error Messages**: Shows helpful errors for invalid input
4. **Examples**: I put some hints in the placeholder text
5. **Clear Button**: Resets everything

### Example Inputs to Try:

- `1,2,3` → Result: 6
- `//;\n1;2;3` → Result: 6
- `//[***]\n1***2***3` → Result: 6
- `//[*][%]\n1*2%3` → Result: 6
- `1,-2` → Error: negative numbers not allowed

## TDD Approach

I followed the classic TDD cycle for this assignment:

1. **Red**: Write a failing test first
2. **Green**: Write just enough code to make it pass
3. **Refactor**: Clean up while keeping tests green

Started with the simplest case (empty string) and gradually added more complex features. All the tests are in `test/string_calculator_test.dart` if you want to see the progression.

## Technical Notes

- Built with Flutter for cross-platform compatibility
- Uses Dart's latest language features (records, pattern matching)
- Follows Flutter best practices for state management
- Comprehensive error handling with user-friendly messages
- Clean architecture separating business logic from UI

## Contributing

Feel free to fork this project and submit pull requests. Make sure to:

- Add tests for new features
- Follow the existing code style
- Update this README if needed

## License

This project is open source and available under the MIT License.
