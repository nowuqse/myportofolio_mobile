import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

/// Ensures the user is authenticated, pushing [LoginScreen] when needed.
Future<bool> ensureLoggedIn(BuildContext context) async {
  // Jika user sudah login, langsung izinkan (return true)
  if (context.read<AuthState>().isLoggedIn) {
    return true;
  }

  // Jika belum login, buka halaman LoginScreen
  // Navigator.push akan mengembalikan nilai (bool) saat halaman login ditutup
  final loggedIn = await Navigator.push<bool>(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );

  // Jika user sukses login, nilainya true. Jika dia menekan tombol back (batal), nilainya null (jadi false).
  return loggedIn ?? false;
}
