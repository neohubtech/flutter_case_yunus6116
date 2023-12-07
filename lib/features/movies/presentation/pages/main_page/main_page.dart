import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.gr.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_case_yunus6116/injection_container.dart';

/// MainPage is the main page of the app.
@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (_) => sl<LocalMoviesBloc>()..add(const GetSavedMovies()),
      child: AutoTabsRouter(
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
      ),
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    return CustomBottomNavigationBar(tabsRouter: tabsRouter);
  }
}
