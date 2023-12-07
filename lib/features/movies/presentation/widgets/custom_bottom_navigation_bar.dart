import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_case_yunus6116/core/theme/colors.dart';
import 'package:flutter_case_yunus6116/core/theme/text_styles.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/pages/saved_movies_page/saved_movies_page.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/widgets/custom_bottom_bar_painter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomBottomNavigationBar({super.key, required this.tabsRouter});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .12,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(context.width, context.height * .12),
            painter: CustomBottomBarPainter(),
          ),
          Stack(
            children: [
              Row(
                children: List.generate(2, (index) {
                  var isSelectedItem = tabsRouter.activeIndex == index;
                  return Expanded(
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        if (index == 0) {
                          tabsRouter.setActiveIndex(index);
                        }
                        if (index == 1) {
                          // ignore: use_build_context_synchronously

                          showModalBottomSheet(
                            //isScrollControlled: true,
                            context: context,
                            useRootNavigator: true,
                            builder: (BuildContext context) {
                              return const SavedMoviesPage();
                            },
                          );
                        }
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Stack(
                            children: [
                              Icon(
                                index == 0 ? Icons.home : Icons.bookmark,
                                color: isSelectedItem ? MainColors.mainLightColor : const Color(0xFF9B9B9B),
                                size: 32,
                              ),
                              if (index == 1) const SavedMovieMarker(),
                            ],
                          ),
                          const SizedBox(height: 5),
                          _buildTabText(index, isSelectedItem),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Positioned(
                top: 24,
                left: context.width * .5 - 1,
                child: Container(
                  height: 24,
                  width: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xFFD1D1D6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabText(int index, bool isSelectedItem) {
    switch (index) {
      case 0:
        return Text(
          'HOME',
          style: AppTextStyles.body12
              .copyWith(color: isSelectedItem ? MainColors.mainLightColor : const Color(0xFF9B9B9B)),
        );
      case 1:
        return Text(
          'SAVED',
          style: AppTextStyles.body12
              .copyWith(color: isSelectedItem ? MainColors.mainLightColor : const Color(0xFF9B9B9B)),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class SavedMovieMarker extends StatelessWidget {
  const SavedMovieMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalMoviesBloc, LocalMoviesState>(
      builder: (context, state) {
        if (state is LocalMoviesLoading) {
          return const SizedBox.shrink();
        } else if (state is LocalMoviesDone) {
          return Positioned(
            top: -5,
            right: -5,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE5E5EA),
              ),
              child: Center(
                child: Text(
                  state.movies!.length.toString(),
                  style: AppTextStyles.body12.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
