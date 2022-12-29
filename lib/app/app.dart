import 'package:flutter/material.dart';

import '../screen/login.dart';
import '../screen/register.dart';
import '../screen/dashboard.dart';
import '../app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Batch',
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/registerScreen': (context) => const RegisterScreen(),
        '/dashboardScreen': (context) => const DashboardScreen(),
      },
    );
  }
}
