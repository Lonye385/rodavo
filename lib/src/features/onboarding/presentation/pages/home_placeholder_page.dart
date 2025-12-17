import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/vehicle_profile_providers.dart';

class HomePlaceholderPage extends ConsumerWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(vehicleProfileProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RodaVO'),
        actions: [
          IconButton(
            tooltip: 'Reset onboarding',
            onPressed: () async {
              await ref.read(vehicleProfileRepositoryProvider).clear();
              ref.invalidate(vehicleProfileProvider);
            },
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Home (placeholder)'),
            const SizedBox(height: 12),
            Text('Veículo: ${profile?.vehicleType.name ?? '-'}'),
            const SizedBox(height: 8),
            Text('Waypoints: ${profile?.waypoints.length ?? 0}'),
          ],
        ),
      ),
    );
  }
}
