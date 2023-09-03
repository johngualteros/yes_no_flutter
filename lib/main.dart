import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_flutter/config/theme/app_theme.dart';
import 'package:yes_no_flutter/presentation/providers/chat_provider.dart';
import 'package:yes_no_flutter/presentation/providers/theme_provider.dart';
import 'package:yes_no_flutter/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: AppTheme().selectedColor ).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}