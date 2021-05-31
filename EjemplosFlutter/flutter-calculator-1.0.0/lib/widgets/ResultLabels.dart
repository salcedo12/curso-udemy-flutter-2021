import 'package:calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class ResultLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state.firstNumber == '0' && state.seconNumber == '0') {
          return MainResultText(
              text: state.mathResult.endsWith('.0')
                  ? state.mathResult.substring(0, state.mathResult.length - 2)
                  : state.mathResult);
        }
        return Column(
          children: [
            SubResult(text: state.firstNumber),
            SubResult(text: state.operation),
            SubResult(
                text: state.seconNumber.endsWith('.0')
                    ? state.seconNumber
                        .substring(0, state.seconNumber.length - 2)
                    : state.seconNumber),
            LineSeparator(),
            MainResultText(
                text: state.mathResult.endsWith('.0')
                    ? state.mathResult.substring(0, state.mathResult.length - 2)
                    : state.mathResult),
          ],
        );
      },
    );
  }
}
