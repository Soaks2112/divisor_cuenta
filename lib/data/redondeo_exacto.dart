import '../domain/estrategia_redondeo.dart';

class RedondeoExacto implements EstrategiaRedondeo {
  @override
  double aplicar(double importe) => (importe * 100).round() / 100;
}
