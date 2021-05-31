import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is ResetAC) {
      yield* this._ResetAc();
      //Agregar numeros
    } else if (event is AddNumber) {
      yield state.copyWith(
        mathResult: (state.mathResult == '0')
            ? event.number
            : state.mathResult + event.number,
      );
    } else if (event is ChangeNegativePositve) {
      yield state.copyWith(
          mathResult: (state.mathResult.contains('-')
              ? state.mathResult.replaceFirst('-', '')
              : '-' + state.mathResult));
    }
    //borrar ultimo digito
    else if (event is DeleteLastEntry) {
      yield state.copyWith(
          mathResult: state.mathResult.length > 1
              ? state.mathResult.substring(0, state.mathResult.length - 1)
              : '0');
    }
    //agregar operacion
    else if (event is OperationEntry) {
      yield state.copyWith(
          firstNumber: state.mathResult,
          mathResult: '0',
          operation: event.operation,
          seconNumber: '0');
    } else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _ResetAc() async* {
    yield CalculatorState(
        firstNumber: '0', mathResult: '0', seconNumber: '0', operation: '+');
  }

  Stream<CalculatorState> _calculateResult() async* {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);
    switch (state.operation) {
      case '+':
        yield state.copyWith(
            seconNumber: state.mathResult, mathResult: '${num1 + num2}');
        break;
      case '-':
        yield state.copyWith(
            seconNumber: state.mathResult, mathResult: '${num1 - num2}');
        break;
      case 'x':
        yield state.copyWith(
            seconNumber: state.mathResult, mathResult: '${num1 * num2}');
        break;
      case '/':
        yield state.copyWith(
            seconNumber: state.mathResult, mathResult: '${num1 / num2}');
        break;
      default:
        yield state;
    }
  }
}
