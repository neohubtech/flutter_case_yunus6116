import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/core/router/app_router.gr.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_state.dart';

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
    // Add GetMovies event to the bloc
    context.read<RemoteMoviesBloc>().add(const GetAllMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<RemoteMoviesBloc, RemoteMoviesState>(
          listener: (context, state) {
            /// If the state is RemoteMoviesDone, then navigate to the MainRoute
            if (state is RemoteMoviesDone) {
              context.router.pushAndPopUntil(const MainRoute(), predicate: (_) => false);
            }

            /// If the state is RemoteMoviesError, then show error snackbar
            if (state is RemoteMoviesError) {
              // Show error snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.toString()),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: const Column(
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
      ),
    );
  }
}
