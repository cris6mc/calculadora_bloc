part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumber extends CalculatorEvent {
   final String number;

  AddNumber(this.number); 
}

class ResetAC extends CalculatorEvent {}

class ChangePositiveNegative extends CalculatorEvent {}

class DeleteLastentry extends CalculatorEvent {}

class OperationEntry extends CalculatorEvent {
  final String operation;
  OperationEntry(this.operation);
}

class CalculateResult extends CalculatorEvent {}
