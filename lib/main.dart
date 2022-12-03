import 'package:amazon_clone_tech387/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_tech387/constants/global_variables.dart';
import 'package:amazon_clone_tech387/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone_tech387/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tech387/features/auth/services/auth_service.dart';
import 'package:amazon_clone_tech387/providers/user_provider.dart';
import 'package:amazon_clone_tech387/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // This banner is intended to deter people from complaining that your app is slow when it's in debug mode.
      title: 'Green Flutter Bank',
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
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
