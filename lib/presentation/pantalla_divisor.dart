import 'package:flutter/material.dart';

import 'divisor_controller.dart';
import 'formateador_moneda.dart';

class PantallaDivisor extends StatefulWidget {
  final DivisorController controller;
  final FormateadorMoneda formateador;

  const PantallaDivisor({
    super.key,
    required this.controller,
    required this.formateador,
  });

  @override
  State<PantallaDivisor> createState() => _PantallaDivisorState();
}

class _PantallaDivisorState extends State<PantallaDivisor> {
  final _monto = TextEditingController();
  final _personas = TextEditingController(text: '2');
  final _propina = TextEditingController(text: '0');
  String _modo = 'exacto';
  EstadoDivision? _estado;

  @override
  void dispose() {
    _monto.dispose();
    _personas.dispose();
    _propina.dispose();
    super.dispose();
  }

  void _calcular() {
    setState(() {
      _estado = widget.controller.calcular(
        montoTexto: _monto.text,
        personasTexto: _personas.text,
        propinaTexto: _propina.text,
        modo: _modo,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final resultado = _estado?.resultado;
    final error = _estado?.error;
    return Scaffold(
      appBar: AppBar(title: const Text('Divisor de cuenta')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Divide la cuenta', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Calcula cuánto debe pagar cada persona.'),
          const SizedBox(height: 24),
          TextField(
            controller: _monto,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Monto total', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _personas,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Número de personas', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _propina,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Propina (%)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _modo,
            decoration: const InputDecoration(labelText: 'Modo de redondeo', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'exacto', child: Text('Exacto')),
              DropdownMenuItem(value: 'arriba', child: Text('Hacia arriba')),
            ],
            onChanged: (value) => setState(() => _modo = value ?? 'exacto'),
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: _calcular, child: const Text('Calcular')),
          if (error != null) ...[
            const SizedBox(height: 24),
            Text(error, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
          if (resultado != null) ...[
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text('Cada persona paga'),
                    const SizedBox(height: 8),
                    Text(widget.formateador.formatear(resultado.porPersona), style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
