import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    super.key,
    required this.movieList,
  });
  final List<MovieEntity> movieList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalMoviesBloc, LocalMoviesState>(
      builder: (context, state) {
        if (state is LocalMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocalMoviesDone) {
          bool isMovieSaved(MovieEntity movie) {
            return state.movies!.contains(movie);
          }

          return Expanded(
            child: ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  margin: const EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Name for each unique category
                      _buildCategoryName(movieList, index),
                      const SizedBox(height: 12),
                      MovieItemListTile(
                        movie: movieList[index],
                        isMovieSaved: isMovieSaved(movieList[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("Unknown Error"));
        }
      },
    );
  }

  _buildCategoryName(List<MovieEntity> movieList, int index) {
    if (index == 0 || movieList[index].type != movieList[index - 1].type) {
      return _buildCategory(movieList, index);
    } else {
      return const SizedBox.shrink();
    }
  }

  Text _buildCategory(List<MovieEntity> movieList, int index) {
    return Text(
      movieList[index].type!,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class MovieItemListTile extends HookWidget {
  const MovieItemListTile({
    super.key,
    required this.movie,
    required this.isMovieSaved,
  });

  final MovieEntity movie;
  final bool isMovieSaved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.network(
        movie.imageUrl!,
        width: 50,
        height: 50,
      ),
      title: Text(movie.name!),
      subtitle: Text(movie.explanation!),
      trailing: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: isMovieSaved
              ? const Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.green,
                )
              : null,
        ),
      ),
      onTap: () {
        if (isMovieSaved) {
          context.read<LocalMoviesBloc>().add(RemoveMovie(movie));
        } else {
          context.read<LocalMoviesBloc>().add(SaveMovie(movie));
        }
      },
    );
  }
}
