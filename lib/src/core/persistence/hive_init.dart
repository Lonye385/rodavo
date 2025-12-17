import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'secure_key_store.dart';

const vehicleProfileBoxName = 'rodavo_vehicle_profile_secure';

Future<void> initHive() async {
  await Hive.initFlutter();

  // Encrypted box on mobile, plain on web.
  final key = await SecureKeyStore().getOrCreateHiveKey();

  if (kIsWeb || key == null) {
    await Hive.openBox<String>(vehicleProfileBoxName);
    return;
  }

  await Hive.openBox<String>(
    vehicleProfileBoxName,
    encryptionCipher: HiveAesCipher(key),
  );
}
