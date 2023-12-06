import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/pages/home_page/widgets/movie_list_widget.dart';
import 'package:flutter_case_yunus6116/injection_container.dart';

@RoutePage()
class SavedMoviesPage extends StatelessWidget {
  const SavedMoviesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalMoviesBloc>()..add(const GetSavedMovies()),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 4.0,
              width: 50.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<LocalMoviesBloc, LocalMoviesState>(
              builder: (context, state) {
                if (state is LocalMoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LocalMoviesDone) {
                  return _buildMoviesList(state.movies!);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  _buildMoviesList(List<MovieEntity> movies) {
    return Expanded(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            margin: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Name for each unique category
                _buildCategoryName(movies, index),
                const SizedBox(height: 12),
                MovieItemListTile(
                  movie: movies[index],
                  isMovieSaved: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildCategoryName(List<MovieEntity> movies, int index) {
    if (index == 0 || movies[index].type != movies[index - 1].type) {
      return _buildCategory(movies, index);
    } else {
      return const SizedBox.shrink();
    }
  }

  Text _buildCategory(List<MovieEntity> movies, int index) {
    return Text(
      movies[index].type!,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
