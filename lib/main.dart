import 'package:flutter/material.dart';
import 'profile/ProfileScreen.dart';
import 'screens/profile_screen.dart' hide ProfileScreen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
