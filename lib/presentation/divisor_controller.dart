import '../domain/calcular_division.dart';
import '../domain/cuenta.dart';
import '../domain/estrategia_redondeo.dart';
import '../domain/resultado.dart';
import '../domain/validar_entrada.dart';

class EstadoDivision {
  final Resultado? resultado;
  final String? error;

  const EstadoDivision({this.resultado, this.error});
}

class DivisorController {
  final ValidarEntrada validador;
  final CalcularDivision calculador;
  final Map<String, EstrategiaRedondeo> estrategias;

  const DivisorController({
    required this.validador,
    required this.calculador,
    required this.estrategias,
  });

  EstadoDivision calcular({
    required String montoTexto,
    required String personasTexto,
    required String propinaTexto,
    required String modo,
  }) {
    final cuenta = Cuenta(
      monto: double.tryParse(montoTexto.trim()) ?? double.nan,
      personas: int.tryParse(personasTexto.trim()) ?? 0,
      propina: double.tryParse(propinaTexto.trim()) ?? double.nan,
    );
    final error = validador.validar(cuenta);
    if (error != null) {
      return EstadoDivision(error: error);
    }
    final estrategia = estrategias[modo];
    if (estrategia == null) {
      return const EstadoDivision(error: 'Modo de redondeo inválido');
    }
    return EstadoDivision(resultado: calculador.calcular(cuenta, estrategia));
  }
}
