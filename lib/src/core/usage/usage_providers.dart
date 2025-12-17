import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cost_estimator.dart';
import 'usage_meter.dart';

final usageMeterProvider = Provider<UsageMeter>((ref) {
  return UsageMeter();
});

final costEstimatorProvider = Provider<CostEstimator>((ref) {
  return const CostEstimator();
});
