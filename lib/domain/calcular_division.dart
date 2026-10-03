import 'cuenta.dart';
import 'estrategia_redondeo.dart';
import 'resultado.dart';

class CalcularDivision {
  Resultado calcular(Cuenta cuenta, EstrategiaRedondeo estrategia) {
    final total = cuenta.monto * (1 + cuenta.propina / 100);
    final importe = total / cuenta.personas;
    return Resultado(porPersona: estrategia.aplicar(importe));
  }
}
