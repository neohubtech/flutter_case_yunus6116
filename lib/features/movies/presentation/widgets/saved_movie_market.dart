import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie/local/local_movie_bloc.dart';
import '../bloc/movie/local/local_movie_state.dart';

/// SavedMovieMarker is a widget that shows the number of saved movies.
class SavedMovieMarker extends StatefulWidget {
  const SavedMovieMarker({
    super.key,
  });

  @override
  State<SavedMovieMarker> createState() => _SavedMovieMarkerState();
}

class _SavedMovieMarkerState extends State<SavedMovieMarker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalMoviesBloc, LocalMoviesState>(
      listener: (context, state) {
        if (state is LocalMoviesDone) {
          _controller.forward(from: 0.0);
        }
      },
      builder: (context, state) {
        if (state is LocalMoviesLoading) {
          return const SizedBox.shrink();
        } else if (state is LocalMoviesDone) {
          return Positioned(
            top: -5,
            right: -5,
            child: Container(
              alignment: Alignment.center,
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE5E5EA),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Text(
                    state.movies!.length.toString(),
                    style: TextStyle(
                      fontSize: _animation.value * 15,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
