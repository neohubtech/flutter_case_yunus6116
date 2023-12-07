import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.dart';
import 'package:flutter_case_yunus6116/core/theme/app_themes.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';

import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_bloc.dart';

import 'injection_container.dart';

/// main is the entry point of the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

/// MyApp is the main widget of the app.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteMoviesBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<LocalMoviesBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Movie App',
        routerConfig: appRouter.config(),
      ),
    );
  }
}
