import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rodavo/src/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  testWidgets('Onboarding renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: const OnboardingPage()),
      ),
    );

    expect(find.text('Onboarding'), findsOneWidget);
  });
}
