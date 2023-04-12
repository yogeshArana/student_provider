import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/provider/student_provider.dart';
import 'package:student_provider/screen/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Student1Provider(),
        )
      ],
      child: const MaterialApp(
        home: StudentDemo(),
      ),
    );
  }
}
