import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Nota: para Android Studio compilar e correr com Firebase,
  // adiciona o teu `google-services.json` e configura o Gradle.
  await Firebase.initializeApp();
  runApp(const RodavoProApp());
}

/// App base com tema Cyberpunk/Neon (Dark Mode) e rotas iniciais.
class RodavoProApp extends StatelessWidget {
  const RodavoProApp({super.key});

  static const String routeSplash = '/';
  static const String routeHome = '/home';
  static const String routeMap = '/map';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rodavo Pro',
      theme: _buildCyberpunkTheme(),
      initialRoute: routeSplash,
      routes: {
        routeSplash: (_) => const _SplashScreen(),
        routeHome: (_) => const _HomeScreen(),
        routeMap: (_) => const _MapScreen(),
      },
    );
  }
}

ThemeData _buildCyberpunkTheme() {
  const neonCyan = Color(0xFF00F5FF);
  const neonMagenta = Color(0xFFFF2BD6);
  const neonGreen = Color(0xFF39FF14);
  const bg = Color(0xFF070A12);
  const surface = Color(0xFF0B1020);
  const surface2 = Color(0xFF101A35);

  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: neonCyan,
      secondary: neonMagenta,
      tertiary: neonGreen,
      surface: surface,
      onSurface: Color(0xFFEAF2FF),
      error: Color(0xFFFF4D4D),
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: bg,
  );

  final textTheme = GoogleFonts.orbitronTextTheme(base.textTheme).apply(
    bodyColor: const Color(0xFFEAF2FF),
    displayColor: const Color(0xFFEAF2FF),
  );

  return base.copyWith(
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      foregroundColor: const Color(0xFFEAF2FF),
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
      ),
    ),
    cardTheme: CardThemeData(
      color: surface2,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: neonCyan.withOpacity(0.18)),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: neonCyan.withOpacity(0.12),
      thickness: 1,
      space: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface2,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.55)),
      labelStyle: const TextStyle(color: Color(0xFFEAF2FF)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: neonCyan.withOpacity(0.20)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: neonCyan, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFFFF4D4D)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFFFF4D4D), width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: neonCyan,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        textStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: neonCyan,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        side: const BorderSide(color: neonCyan, width: 1.2),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        textStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surface2,
      contentTextStyle: textTheme.bodyMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: cs.primary.withOpacity(0.30)),
            boxShadow: [
              BoxShadow(
                color: cs.primary.withOpacity(0.22),
                blurRadius: 24,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: cs.secondary.withOpacity(0.16),
                blurRadius: 30,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'RODAVO PRO',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.1,
                      color: cs.primary,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Migração para Flutter (base)',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white.withOpacity(0.80)),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed(
                      RodavoProApp.routeHome,
                    ),
                    child: const Text('ENTRAR'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed(
                      RodavoProApp.routeMap,
                    ),
                    child: const Text('MAPA'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rodavo Pro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Home (placeholder)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                RodavoProApp.routeMap,
              ),
              child: const Text('ABRIR MAPA'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapScreen extends StatelessWidget {
  const _MapScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: const Center(
        child: Text('Mapa (placeholder)'),
      ),
    );
  }
}

