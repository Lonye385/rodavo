import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../here_cpm.dart';
import '../usage_event_type.dart';
import '../usage_providers.dart';

class UsageDashboardPage extends ConsumerWidget {
  const UsageDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usage & Cost (30d)')),
      body: FutureBuilder(
        future: ref.read(usageMeterProvider).getLastNDaysCounts(30),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final counts = snapshot.data!;
          final estimated = ref.read(costEstimatorProvider).estimateEur(counts);

          final rows = UsageEventType.values
              .map((t) {
                final n = counts[t] ?? 0;
                final cpm = hereCpmEur[t] ?? 0;
                final cost = (n / 1000.0) * cpm;
                return (t, n, cpm, cost);
              })
              .where((r) => r.$2 > 0)
              .toList(growable: false);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Estimativa HERE (últimos 30 dias): €${estimated.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    FilledButton.tonal(
                      onPressed: () async {
                        await ref.read(usageMeterProvider).clearAll();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reset OK')));
                          (context as Element).markNeedsBuild();
                        }
                      },
                      child: const Text('Reset (dev)'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: rows.length,
                    itemBuilder: (context, i) {
                      final (t, n, cpm, cost) = rows[i];
                      return ListTile(
                        title: Text(t.name),
                        subtitle: Text('CPM: €${cpm.toStringAsFixed(2)} / 1000'),
                        trailing: Text('$n → €${cost.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
