import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  // {
  //   on<CalculatorEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    if (event is ResetAC) {
      yield* _resetAC();
    } else if (event is AddNumber) {
      yield state.copyWith(
          result: (state.result == "0")
              ? event.number
              : state.result + event.number);
    } else if (event is ChangePositiveNegative) {
      yield state.copyWith(
          result: state.result.contains("-")
              ? state.result.replaceFirst("-", "")
              : "-${state.result}");
    } else if (event is DeleteLastentry) {
      yield state.copyWith(
          result: state.result.length > 1
              ? state.result.substring(0, state.result.length - 1)
              : "0");
    } else if (event is OperationEntry) {
      yield state.copyWith(
        firstNunmber: state.result,
        operation: event.operation,
        result: "0",
      );
    } else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
      firstNunmber: "0",
      operation: "none",
      secondNumber: "0",
      result: "0",
    );
  }

  Stream<CalculatorState> _calculateResult() async* {
    final double num1 = double.parse(state.firstNunmber);
    final double num2 = double.parse(state.result);

    switch (state.operation) {
      case "+":
        yield state.copyWith(
          result: "${num1 + num2}",
          secondNumber: state.result,
        );
        break;
      case "-":
        yield state.copyWith(
          result: "${num1 - num2}",
          secondNumber: state.result,
        );
        break;
      case "X":
        yield state.copyWith(
          result: "${num1 * num2}",
          secondNumber: state.result,
        );
        break;
      case "/":
        yield state.copyWith(
          result: "${num1 / num2}",
          secondNumber: state.result,
        );
        break;
      default:
        yield state;
        break;
    }
  }
}
