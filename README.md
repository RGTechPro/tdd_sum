# String Calculator - TDD Implementation

A Flutter implementation of the classic String Calculator kata using Test-Driven Development (TDD) principles.

## What is this?

This is my implementation of the String Calculator kata assignment. I built it using Flutter with proper TDD methodology - wrote tests first, then implemented the features step by step. Also added a simple UI so you can actually try it out instead of just running tests.

The calculator handles various input formats:

- Simple comma-separated numbers: `1,2,3`
- Newline-separated numbers: `1\n2\n3`
- Custom single delimiters: `//;\n1;2;3`
- Multi-character delimiters: `//[***]\n1***2***3`
- Multiple delimiters: `//[*][%]\n1*2%3`

## Features

- ✅ Handles empty strings (returns 0)
- ✅ Supports unlimited numbers in input
- ✅ Multiple delimiter support (comma, newline, custom)
- ✅ Custom delimiter syntax with `//` prefix
- ✅ Multi-character delimiters using bracket notation
- ✅ Multiple delimiters in single input
- ✅ Negative number validation (throws exceptions)
- ✅ Ignores numbers greater than 1000
- ✅ Clean Flutter UI for interactive testing

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
