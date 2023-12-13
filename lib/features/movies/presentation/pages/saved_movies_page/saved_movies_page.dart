import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movie/local/local_movie_bloc.dart';
import '../../bloc/movie/local/local_movie_event.dart';
import '../../bloc/movie/local/local_movie_state.dart';
import '../../../../../injection_container.dart';
import 'package:lottie/lottie.dart';

/// SavedMoviesPage is the page that is shown when the user clicks the shopping cart icon in the bottom navigation bar.
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
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            const SizedBox(height: 28),
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

  Widget _buildMoviesList(List<MovieEntity> movies) {
    return movies.isNotEmpty
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    "Selected Items",
                    style: AppTextStyles.heading2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.builder(
                      itemCount: movies.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: movies[index].imageUrl!,
                                width: context.width * .25 - 24,
                                height: context.width * .25 - 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movies[index].name!,
                              style: AppTextStyles.heading1.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movies[index].type!,
                              style: AppTextStyles.heading4.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/empty_list.json',
                fit: BoxFit.fill,
              ),
              Text(
                "No selected movies yet!\nPlease select some movies to see here.",
                textAlign: TextAlign.center,
                style: AppTextStyles.heading3.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
  }
}
