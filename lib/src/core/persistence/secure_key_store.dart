import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureKeyStore {
  SecureKeyStore({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  static const _hiveKeyName = 'rodavo_hive_aes_key_v1';

  final FlutterSecureStorage _storage;

  /// Returns a 32-byte key for HiveAesCipher.
  Future<Uint8List?> getOrCreateHiveKey() async {
    // Hive encryption is not supported for web in the same way.
    if (kIsWeb) return null;

    final existing = await _storage.read(key: _hiveKeyName);
    if (existing != null && existing.isNotEmpty) {
      final bytes = base64Url.decode(existing);
      if (bytes.length == 32) return Uint8List.fromList(bytes);
    }

    final rnd = Random.secure();
    final key = Uint8List.fromList(List<int>.generate(32, (_) => rnd.nextInt(256)));
    await _storage.write(key: _hiveKeyName, value: base64UrlEncode(key));
    return key;
  }
}
