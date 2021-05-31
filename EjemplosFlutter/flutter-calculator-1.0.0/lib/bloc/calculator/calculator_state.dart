part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String seconNumber;
  final String operation;
  CalculatorState({
    this.mathResult = '30',
    this.firstNumber = '10',
    this.seconNumber = '20',
    this.operation = '+',
  });

  CalculatorState copyWith({
    String? mathResult,
    String? firstNumber,
    String? seconNumber,
    String? operation,
  }) =>
      CalculatorState(
        mathResult: mathResult ?? this.mathResult,
        firstNumber: firstNumber ?? this.firstNumber,
        seconNumber: seconNumber ?? this.seconNumber,
        operation: operation ?? this.operation,
      );
}
