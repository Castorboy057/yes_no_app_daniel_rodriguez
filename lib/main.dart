import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_rodriguez/config/theme/app_theme.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yes no app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const ChatScreen()
    );
  }
}
