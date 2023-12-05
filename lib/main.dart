import 'package:flutter/material.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.dart';
import 'package:flutter_case_yunus6116/core/theme/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: 'Movie App',
      routerConfig: appRouter.config(),
    );
  }
}
