import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:learn/main.dart';
import 'package:learn/presentation/pages/Home/home_page.dart';
import 'package:learn/presentation/pages/on_boarding/on_boarding.dart'; // pastikan path import sesuai projectmu

void main() {
  setUpAll(() async {
    // Inisialisasi Hive untuk Flutter
    await Hive.initFlutter();
    // Buka box yang digunakan di aplikasi
    await Hive.openBox('authBox');
    // Kosongkan box supaya test fresh
    final box = Hive.box('authBox');
    await box.clear();
  });

  testWidgets('MyApp menampilkan OnBoarding ketika token null',
      (WidgetTester tester) async {
    // Pastikan box kosong (token null)
    final box = Hive.box('authBox');
    await box.clear();

    await tester.pumpWidget(const MyApp());

    // Cek widget OnBoarding muncul
    expect(find.byType(OnBoarding), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });

  testWidgets('MyApp menampilkan HomePage ketika token ada',
      (WidgetTester tester) async {
    final box = Hive.box('authBox');
    // Simulasikan token sudah tersimpan
    await box.put('token', 'dummy_token');

    await tester.pumpWidget(const MyApp());

    // Cek widget HomePage muncul
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(OnBoarding), findsNothing);

    // Hapus token setelah test supaya tidak mengganggu test lain
    await box.clear();
  });
}
