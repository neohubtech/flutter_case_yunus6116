import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.gr.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SavedMoviesRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    return CustomBottomNavigationBar(tabsRouter: tabsRouter);
  }
}
