import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Home can open the add project page', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Welcome to MyPortfolio Mobile!'), findsOneWidget);
    expect(find.text('Add Project'), findsOneWidget);

    await tester.tap(find.text('Add Project'));
    await tester.pumpAndSettle();

    expect(find.text('Add Project Form'), findsOneWidget);
    expect(find.text('Project Name'), findsWidgets);
    expect(find.text('Save'), findsOneWidget);
  });

  testWidgets('Home can open and validate the add experience page', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Add Experience'));
    await tester.tap(find.text('Add Experience'));
    await tester.pumpAndSettle();

    expect(find.text('Add Experience Form'), findsOneWidget);
    expect(find.text('Experience Title'), findsOneWidget);

    await tester.ensureVisible(find.text('Save Experience'));
    await tester.tap(find.text('Save Experience'));
    await tester.pump();

    expect(find.text('Experience title cannot be empty!'), findsOneWidget);
    expect(find.text('Description cannot be empty!'), findsOneWidget);
  });
}
