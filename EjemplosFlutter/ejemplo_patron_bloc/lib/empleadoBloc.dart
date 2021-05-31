//Patron Bloc

import 'dart:async';
import 'dart:ffi';
import 'empleado.dart';

class EmpleadoBloc {
  List<Empleado> _empleadoList = [
    Empleado(1, "Empleado 1", 100000),
    Empleado(2, "Empleado 2", 200000),
    Empleado(3, "Empleado 3", 300000),
    Empleado(4, "Empleado 4", 400000),
    Empleado(5, "Empleado 5", 500000),
  ];

  //Streams Controller

  final _empleadoListStreamController = StreamController<List<Empleado>>();

  final _empleadoSalarioIncrementStreamController =
      StreamController<Empleado>();

  final _empleadoSalarioDecrementStreamController =
      StreamController<Empleado>();

  //getters: streams y sinks

  Stream<List<Empleado>> get empleadoListStream =>
      _empleadoListStreamController.stream;

  StreamSink<List<Empleado>> get empleadoListSink =>
      _empleadoListStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioIncrement =>
      _empleadoSalarioIncrementStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioDecrement =>
      _empleadoSalarioDecrementStreamController.sink;

  //constructor

  EmpleadoBloc() {
    _empleadoListStreamController.add(_empleadoList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementStreamController.stream.listen(_drecrementSalario);
  }

  //Funciones principañes (core function)

  _incrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20 / 100;

    _empleadoList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  _drecrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20 / 100;

    _empleadoList[empleado.id - 1].salario = salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  //dispose

  void dispose() {
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
    _empleadoListStreamController.close();
  }
}
