import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'budget_providers.dart';

part 'lite_mode_provider.g.dart';

@riverpod
Future<bool> shouldUseLiteMode(Ref ref) async {
  return ref.watch(budgetGuardProvider).shouldEnableLiteMode();
}
