import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/pages/home_page/widgets/banner_slider_widget.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/pages/home_page/widgets/movie_list_widget.dart';

/// HomePage is the home page of the app.
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Movie App",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: const AutoLeadingButton(ignorePagelessRoutes: true),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RemoteMoviesBloc, RemoteMoviesState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // BannerSlider is used to show the banners of the movies
              BannerSliderWidget(bannerList: state.allMovies!.bannerList!),
              // Categorized All Movies List
              MovieListWidget(movieList: state.allMovies!.movieList!),
            ],
          ),
        );
      },
    );
  }
}
