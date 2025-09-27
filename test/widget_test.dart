import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf_code_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Używamy prawidłowej klasy głównej aplikacji: LeafCodeApp
    await tester.pumpWidget(const LeafCodeApp()); // Zgodnie z main.dart, główna klasa to MainApp

    // Poniższe asercje pochodzą z Twojego oryginalnego testu typu "counter app".
    // Pamiętaj, że w Twojej aplikacji LeafCodeApp, która ma HomePage, te asercje
    // mogą się nie powieść, ponieważ nie ma w niej licznika ani przycisku Icons.add.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
