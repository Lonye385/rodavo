import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';
import 'src/core/persistence/hive_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await initHive();

  runZonedGuarded(
    () => runApp(const ProviderScope(child: RodaVOApp())),
    (error, stack) {
      // TODO: Integrar Crashlytics quando o Firebase estiver configurado.
      debugPrint('Uncaught error: $error');
      debugPrint('$stack');
    },
  );
}
