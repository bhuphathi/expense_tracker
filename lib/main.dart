import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/expenses_screen.dart';
// import 'package:flutter/services.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
  brightness: Brightness.dark,
);

enum CurrentThemeMode { light, dark }

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (fn) => runApp(const App()),
  // );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var themeMode = CurrentThemeMode.light;
  var colorScheme = lightColorScheme;

  void toggleTheme() {
    setState(() {
      if (themeMode == CurrentThemeMode.light) {
        themeMode = CurrentThemeMode.dark;
        colorScheme = darkColorScheme;
      } else {
        themeMode = CurrentThemeMode.light;
        colorScheme = lightColorScheme;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primaryContainer),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: colorScheme.error.withAlpha(150),
          ),
        ),
      ),
      home: ExpensesScreen(
        toggleTheme: toggleTheme,
        themeMode: themeMode,
      ),
    );
  }
}
