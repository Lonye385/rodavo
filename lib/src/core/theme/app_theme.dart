import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _cyberpunkBackground = Color(0xFF0B0F19);
const _neonCyan = Color(0xFF00E5FF);
const _neonMagenta = Color(0xFFFF2D95);

ThemeData buildCyberpunkTheme({required bool isLowSpec}) {
  final base = ThemeData.dark(useMaterial3: true);

  final textTheme = GoogleFonts.rajdhaniTextTheme(base.textTheme).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );

  return base.copyWith(
    scaffoldBackgroundColor: _cyberpunkBackground,
    colorScheme: base.colorScheme.copyWith(
      surface: const Color(0xFF0E1422),
      primary: _neonCyan,
      secondary: _neonMagenta,
    ),
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: _cyberpunkBackground,
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF10192B),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    pageTransitionsTheme: isLowSpec
        ? const PageTransitionsTheme(builders: {
            TargetPlatform.android: _NoTransitionsBuilder(),
            TargetPlatform.iOS: _NoTransitionsBuilder(),
          })
        : base.pageTransitionsTheme,
  );
}

class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
