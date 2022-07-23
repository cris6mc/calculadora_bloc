import 'package:calculadora_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculadora_bloc/widgets/main_result.dart';
import 'package:calculadora_bloc/widgets/line_separator.dart';
import 'package:calculadora_bloc/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsLabel extends StatelessWidget {
  const ResultsLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {

        if(state.firstNunmber == '0' && state.secondNumber == '0'){
          return MainResultText(text: state.result.endsWith(".0") ? state.result.substring(0, state.result.length-2) : state.result);

        }

        return Column(
        children: [
          SubResult(text: state.firstNunmber),
          SubResult(text: state.operation),
          SubResult(text: state.secondNumber.endsWith(".0") ? state.secondNumber.substring(0, state.secondNumber.length-2) : state.secondNumber),
          const LineSeparator(),
          MainResultText(text: state.result.endsWith(".0") ? state.result.substring(0, state.result.length-2) : state.result),
        ]
      );
      },
    );
  }
}

