import 'cuenta.dart';

class ValidarEntrada {
  String? validar(Cuenta cuenta) {
    if (cuenta.monto.isNaN || cuenta.monto.isInfinite || cuenta.monto < 0) {
      return 'Monto inválido';
    }
    if (cuenta.personas < 1) {
      return 'Debe haber al menos una persona';
    }
    if (cuenta.propina.isNaN || cuenta.propina.isInfinite || cuenta.propina < 0) {
      return 'Propina inválida';
    }
    if (cuenta.propina > 100) {
      return 'La propina no puede superar el 100%';
    }
    return null;
  }
}
