import 'package:flutter_test/flutter_test.dart';

import 'package:divisor_cuenta/data/redondeo_exacto.dart';
import 'package:divisor_cuenta/data/redondeo_hacia_arriba.dart';
import 'package:divisor_cuenta/domain/calcular_division.dart';
import 'package:divisor_cuenta/domain/cuenta.dart';
import 'package:divisor_cuenta/domain/validar_entrada.dart';

import 'casos_de_prueba.dart';

void main() {
  final validador = ValidarEntrada();
  final calculador = CalcularDivision();
  final exacto = RedondeoExacto();
  final arriba = RedondeoHaciaArriba();

  for (final caso in casos) {
    test(caso.nombre, () {
      final cuenta = Cuenta(monto: caso.monto, personas: caso.personas, propina: caso.propina);
      final error = validador.validar(cuenta);
      if (caso.errorEsperado != null) {
        expect(error, caso.errorEsperado);
        expect(error, isNotNull);
        return;
      }
      expect(error, isNull);
      final estrategia = estrategiaPara(caso.modo, exacto, arriba);
      final resultado = calculador.calcular(cuenta, estrategia);
      expect(resultado.porPersona, closeTo(caso.esperado!, 0.001));
    });
  }

  test('LSP permite sustituir estrategias sin preguntar el tipo', () {
    const cuenta = Cuenta(monto: 10, personas: 3, propina: 0);
    final estrategias = <dynamic>[exacto, arriba];
    expect(calculador.calcular(cuenta, estrategias[0]).porPersona, closeTo(3.33, 0.001));
    expect(calculador.calcular(cuenta, estrategias[1]).porPersona, closeTo(4.00, 0.001));
  });
}
