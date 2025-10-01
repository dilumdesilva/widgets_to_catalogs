import 'package:flutter/material.dart';
import 'themes/app_themes.dart';
import 'screens/fridge_app_screen.dart';

void main() {
  runApp(const FridgeApp());
}

class FridgeApp extends StatelessWidget {
  const FridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What\'s in the fridge',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const FridgeAppScreen(),
    );
  }
}
