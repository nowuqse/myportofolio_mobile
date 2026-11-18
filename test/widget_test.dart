import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Home dapat membuka halaman tambah proyek', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);

    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    expect(find.text('Add Project Form'), findsOneWidget);
    expect(find.text('Nama Proyek'), findsWidgets);
    expect(find.text('Save'), findsOneWidget);
  });
}
