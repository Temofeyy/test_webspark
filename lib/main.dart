import 'package:flutter/material.dart' hide Router;

import 'routing/router.dart';
import 'utils/user_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFF),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),

        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            disabledForegroundColor: Colors.grey.shade800,
            disabledBackgroundColor: Colors.blue.withOpacity(0.2),
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
    );

  }
}
