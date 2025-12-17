import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/device/device_check_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class RodaVOApp extends ConsumerWidget {
  const RodaVOApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLowSpec = ref.watch(isLowSpecModeProvider).valueOrNull ?? false;
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'RodaVO',
      theme: buildCyberpunkTheme(isLowSpec: isLowSpec),
      routerConfig: router,
    );
  }
}
