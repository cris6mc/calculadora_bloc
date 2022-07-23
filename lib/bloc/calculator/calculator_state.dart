part of 'calculator_bloc.dart';

 class CalculatorState {
  final String result;
  final String firstNunmber;
  final String secondNumber;
  final String operation;

  CalculatorState({
    this.result = '30', 
    this.firstNunmber = '10', 
    this.secondNumber = '20', 
    this.operation = '+',
    });

    CalculatorState copyWith({
    String? result, 
    String? firstNunmber, 
    String? secondNumber, 
    String? operation,
    })=> CalculatorState(
      firstNunmber: firstNunmber ?? this.firstNunmber,
      secondNumber: secondNumber ?? this.secondNumber,
      result: result ?? this.result,
      operation: operation ?? this.operation,
      );
}

