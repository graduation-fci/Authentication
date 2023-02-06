import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import '../screens/login_style.dart';
import '../screens/register.dart';
import './providers/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'first demo',
        theme: ThemeData(
          //useMaterial3: true,
          primarySwatch: Colors.red,
        ),
        home: RegisterFormScreen(),
      ),
    );
  }
}
