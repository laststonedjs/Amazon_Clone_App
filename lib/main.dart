import 'package:amazon_clone_tech387/constants/global_variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        // ignore: prefer_const_constructors
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello..'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                'Amazon Home Page',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me!'),
            ),
          ],
        ),
      ),
    );
  }
}
