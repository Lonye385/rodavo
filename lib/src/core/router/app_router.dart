import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/home_placeholder_page.dart';
import '../../features/onboarding/presentation/providers/vehicle_profile_providers.dart';
import '../usage/presentation/usage_dashboard_page.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const _RootGate(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePlaceholderPage(),
      ),
      GoRoute(
        path: '/usage',
        builder: (context, state) => const UsageDashboardPage(),
      ),
    ],
  );
}

class _RootGate extends ConsumerWidget {
  const _RootGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(vehicleProfileProvider);

    return profile.when(
      data: (p) => p == null ? const OnboardingPage() : const HomePlaceholderPage(),
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const OnboardingPage(),
    );
  }
}
