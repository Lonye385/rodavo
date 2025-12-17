import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'secure_key_store.dart';

const vehicleProfileBoxName = 'rodavo_vehicle_profile_secure';
const routingCacheBoxName = 'rodavo_routing_cache_secure';
const searchCacheBoxName = 'rodavo_search_cache_secure';
const hazardsBoxName = 'rodavo_hazards_secure';

Future<void> initHive() async {
  await Hive.initFlutter();

  // Encrypted box on mobile, plain on web.
  final key = await SecureKeyStore().getOrCreateHiveKey();

  if (kIsWeb || key == null) {
    await Hive.openBox<String>(vehicleProfileBoxName);
    await Hive.openBox<String>(routingCacheBoxName);
    await Hive.openBox<String>(searchCacheBoxName);
    await Hive.openBox<String>(hazardsBoxName);
    return;
  }

  await Hive.openBox<String>(
    vehicleProfileBoxName,
    encryptionCipher: HiveAesCipher(key),
  );

  await Hive.openBox<String>(
    routingCacheBoxName,
    encryptionCipher: HiveAesCipher(key),
  );

  await Hive.openBox<String>(
    searchCacheBoxName,
    encryptionCipher: HiveAesCipher(key),
  );

  await Hive.openBox<String>(
    hazardsBoxName,
    encryptionCipher: HiveAesCipher(key),
  );
}
