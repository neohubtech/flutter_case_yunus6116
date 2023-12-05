import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.gr.dart';

/// SplashScreen is the first screen that is shown when the app is opened.
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    //FlutterNativeSplash.remove();
    // add GetMovies event to the bloc
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const MainRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.home,
                size: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
