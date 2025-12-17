import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/hazards_local_datasource.dart';
import '../../data/repositories/hazards_repository_impl.dart';
import '../../domain/repositories/hazards_repository.dart';

final hazardsLocalDataSourceProvider = Provider<HazardsLocalDataSource>((ref) {
  return HazardsLocalDataSource();
});

final hazardsRepositoryProvider = Provider<HazardsRepository>((ref) {
  return HazardsRepositoryImpl(ref.watch(hazardsLocalDataSourceProvider));
});
