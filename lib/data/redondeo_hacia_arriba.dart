import '../domain/estrategia_redondeo.dart';

class RedondeoHaciaArriba implements EstrategiaRedondeo {
  @override
  double aplicar(double importe) => importe.ceilToDouble();
}
