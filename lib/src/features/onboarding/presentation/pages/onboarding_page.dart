import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/vehicle_profile.dart';
import '../providers/onboarding_controller.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();

  VehicleGroup _group = VehicleGroup.groupA;
  VehicleType _type = VehicleType.truck;

  final _vehicleNameCtrl = TextEditingController();
  final List<TextEditingController> _waypointCtrls = [TextEditingController()];

  @override
  void dispose() {
    _vehicleNameCtrl.dispose();
    for (final c in _waypointCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  List<VehicleType> get _allowedTypes => _group == VehicleGroup.groupA
      ? const [VehicleType.truck, VehicleType.bus, VehicleType.rv]
      : const [VehicleType.car, VehicleType.moto];

  String get _groupLabel => _group == VehicleGroup.groupA ? 'Grupo A (14,99€)' : 'Grupo B (4,99€)';

  void _setGroup(VehicleGroup group) {
    setState(() {
      _group = group;
      final allowed = _allowedTypes;
      if (!allowed.contains(_type)) {
        _type = allowed.first;
      }
    });
  }

  Future<void> _onSave() async {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    final waypoints = _waypointCtrls.map((c) => c.text).toList(growable: false);

    await ref.read(onboardingControllerProvider.notifier).save(
          group: _group,
          type: _type,
          waypoints: waypoints,
          vehicleDisplayName: _vehicleNameCtrl.text.trim(),
        );

    final ctrlState = ref.read(onboardingControllerProvider);
    if (ctrlState.hasError) {
      if (!mounted) return;
      final msg = (ctrlState.error is ArgumentError) ? (ctrlState.error as ArgumentError).message : 'Falha ao guardar.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$msg')));
      return;
    }

    if (!mounted) return;
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(onboardingControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Perfil do Veículo & Waypoints Essenciais',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'A rota deve seguir exatamente a sequência definida.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              Text('Pricing: $_groupLabel', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<VehicleGroup>(
                segments: const [
                  ButtonSegment(value: VehicleGroup.groupA, label: Text('Grupo A')),
                  ButtonSegment(value: VehicleGroup.groupB, label: Text('Grupo B')),
                ],
                selected: {_group},
                onSelectionChanged: saving
                    ? null
                    : (s) {
                        _setGroup(s.first);
                      },
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<VehicleType>(
                key: ValueKey(_group),
                initialValue: _type,
                items: _allowedTypes
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(t.name.toUpperCase()),
                      ),
                    )
                    .toList(growable: false),
                onChanged: saving
                    ? null
                    : (v) {
                        if (v == null) return;
                        setState(() => _type = v);
                      },
                decoration: const InputDecoration(labelText: 'Tipo de veículo'),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _vehicleNameCtrl,
                enabled: !saving,
                decoration: const InputDecoration(
                  labelText: 'Nome do veículo (opcional)',
                  hintText: 'Ex: Actros 1845, Caddy, etc.',
                ),
              ),

              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Waypoints obrigatórios',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: saving
                        ? null
                        : () {
                            setState(() {
                              _waypointCtrls.add(TextEditingController());
                            });
                          },
                    icon: const Icon(Icons.add),
                    label: const Text('Adicionar'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              for (final entry in _waypointCtrls.asMap().entries)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: entry.value,
                          enabled: !saving,
                          decoration: InputDecoration(
                            labelText: 'Waypoint #${entry.key + 1}',
                            hintText: 'Morada/cidade/POI',
                          ),
                          validator: (v) {
                            // At least one non-empty waypoint is required.
                            final anyNonEmpty = _waypointCtrls.any((c) => c.text.trim().isNotEmpty);
                            if (!anyNonEmpty) return 'Indique pelo menos 1 waypoint.';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        tooltip: 'Remover',
                        onPressed: saving
                            ? null
                            : () {
                                if (_waypointCtrls.length == 1) return;
                                setState(() {
                                  final c = _waypointCtrls.removeAt(entry.key);
                                  c.dispose();
                                });
                              },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: _waypointCtrls.length == 1 ? Colors.white24 : null,
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 12),
              FilledButton(
                onPressed: saving ? null : _onSave,
                child: saving ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Guardar e continuar'),
              ),

              const SizedBox(height: 12),
              Text(
                'Nota: Nesta fase guardamos apenas o perfil local e a sequência de waypoints. A integração HERE (Truck Routing Nível 1) entra no próximo módulo de navegação.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
