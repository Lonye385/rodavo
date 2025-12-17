import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/onboarding/presentation/providers/vehicle_profile_providers.dart';
import '../usage_providers.dart';
import 'budget_guard.dart';
import 'plan_policy.dart';
import 'plan_tier.dart';

/// Temporary tier resolver:
/// - Group B => 4.90
/// - Group A (and TVDE later) => 14.90
///
/// When RevenueCat is integrated, replace this with entitlement-based tier.
final planTierProvider = Provider<PlanTier>((ref) {
  final profile = ref.watch(vehicleProfileProvider).valueOrNull;
  if (profile == null) return PlanTier.basic490;
  return profile.vehicleGroup.name == 'groupA' ? PlanTier.pro1490 : PlanTier.basic490;
});

final planPolicyProvider = Provider<PlanPolicy>((ref) {
  return PlanPolicy(ref.watch(planTierProvider));
});

final budgetGuardProvider = Provider<BudgetGuard>((ref) {
  return BudgetGuard(
    meter: ref.watch(usageMeterProvider),
    policy: ref.watch(planPolicyProvider),
  );
});
