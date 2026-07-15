import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sandbox/main.dart';

void main() {
  testWidgets('sandbox home shows its navigation and debugger control', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to the Flutter Sandbox!'), findsOneWidget);
    expect(find.text('Go to Buttons Page'), findsOneWidget);
    expect(
      find.byTooltip('Show the semantics debugger overlay'),
      findsOneWidget,
    );
  });
}
