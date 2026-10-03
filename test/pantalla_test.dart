import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:divisor_cuenta/data/redondeo_exacto.dart';
import 'package:divisor_cuenta/data/redondeo_hacia_arriba.dart';
import 'package:divisor_cuenta/domain/calcular_division.dart';
import 'package:divisor_cuenta/domain/validar_entrada.dart';
import 'package:divisor_cuenta/presentation/divisor_controller.dart';
import 'package:divisor_cuenta/presentation/formateador_moneda.dart';
import 'package:divisor_cuenta/presentation/pantalla_divisor.dart';

Widget appDePrueba() {
  return MaterialApp(
    home: PantallaDivisor(
      controller: DivisorController(
        validador: ValidarEntrada(),
        calculador: CalcularDivision(),
        estrategias: {'exacto': RedondeoExacto(), 'arriba': RedondeoHaciaArriba()},
      ),
      formateador: FormateadorMoneda(),
    ),
  );
}

void main() {
  testWidgets('calcula 27.50 en pantalla', (tester) async {
    await tester.pumpWidget(appDePrueba());
    await tester.enterText(find.byType(TextField).at(0), '100');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.enterText(find.byType(TextField).at(2), '10');
    await tester.tap(find.text('Calcular'));
    await tester.pump();
    expect(find.text('\$27.50'), findsOneWidget);
  });

  testWidgets('muestra error para cero personas y no resultado', (tester) async {
    await tester.pumpWidget(appDePrueba());
    await tester.enterText(find.byType(TextField).at(0), '50');
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.tap(find.text('Calcular'));
    await tester.pump();
    expect(find.text('Debe haber al menos una persona'), findsOneWidget);
    expect(find.textContaining('Cada persona paga'), findsNothing);
  });

  testWidgets('muestra error para monto no numerico', (tester) async {
    await tester.pumpWidget(appDePrueba());
    await tester.enterText(find.byType(TextField).at(0), 'abc');
    await tester.tap(find.text('Calcular'));
    await tester.pump();
    expect(find.text('Monto inválido'), findsOneWidget);
  });
}
