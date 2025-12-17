import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_check_provider.g.dart';

@riverpod
Future<bool> isLowSpecMode(Ref ref) async {
  // Conservative: only enable low-spec when we have strong signals.
  if (kIsWeb) return true;

  final info = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final android = await info.androidInfo;

    // Old Android versions are a strong proxy for older devices.
    if (android.version.sdkInt <= 28) return true;

    final memMb = await _tryReadAndroidTotalMemMb();
    if (memMb != null && memMb <= 3000) return true;

    // Weak heuristic fallback: very old/low-end chipsets often expose 32-bit ABI.
    final abis = android.supportedAbis;
    if (abis.any((a) => a.contains('armeabi-v7a'))) return true;

    return false;
  }

  if (Platform.isIOS) {
    final ios = await info.iosInfo;
    final machine = ios.utsname.machine;

    // Rough cut: iPhone 8 / X era and older.
    final legacyPrefixes = <String>[
      'iPhone7,',
      'iPhone8,',
      'iPhone9,',
      'iPhone10,',
      'iPad5,',
      'iPad6,',
    ];

    if (legacyPrefixes.any(machine.startsWith)) return true;
    return false;
  }

  // Other platforms (desktop) keep full experience.
  return false;
}

Future<int?> _tryReadAndroidTotalMemMb() async {
  try {
    final f = File('/proc/meminfo');
    if (!await f.exists()) return null;

    final content = await f.readAsString();
    final lines = const LineSplitter().convert(content);
    final totalLine = lines.firstWhere(
      (l) => l.startsWith('MemTotal:'),
      orElse: () => '',
    );
    if (totalLine.isEmpty) return null;

    // Format: "MemTotal:       3620968 kB"
    final parts = totalLine.split(RegExp(r'\s+')).where((e) => e.isNotEmpty);
    final kb = int.tryParse(parts.elementAt(1));
    if (kb == null) return null;
    return (kb / 1024).floor();
  } catch (_) {
    return null;
  }
}
