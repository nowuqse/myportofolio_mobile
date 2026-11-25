import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient;

  const MyApp({required this.apiClient, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Menyediakan ApiClient ke seluruh widget tree
        Provider.value(value: apiClient),

        // Menyediakan AuthState dan menghubungkannya dengan ApiClient
        ChangeNotifierProvider(create: (context) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'MyPortfolio',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 248, 216, 255),
            secondary: Colors.amber[700],
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
