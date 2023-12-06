import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_case_yunus6116/core/theme/colors.dart';
import 'package:flutter_case_yunus6116/core/theme/text_styles.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/pages/saved_movies_page/saved_movies_page.dart';
import 'package:flutter_case_yunus6116/injection_container.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomBottomNavigationBar({super.key, required this.tabsRouter});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalMoviesBloc>()..add(const GetSavedMovies()),
      child: BlocBuilder<LocalMoviesBloc, LocalMoviesState>(
        builder: (context, state) {
          if (state is LocalMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocalMoviesDone) {
            SizedBox(
              height: context.height * .12,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(context.width, context.height * .12),
                    painter: RPSCustomPainter(),
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
                                      if (index == 1)
                                        Positioned(
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
                                                '2',
                                                style: AppTextStyles.body12.copyWith(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
                  // add vertical divider to the center
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 1.010000);
    path_0.lineTo(size.width * 1.003139, size.height * 1.010000);
    path_0.lineTo(size.width * 1.002632, size.height * 0.9983890);
    path_0.lineTo(size.width * 0.9658080, size.height * 0.1526080);
    path_0.cubicTo(size.width * 0.9622293, size.height * 0.07038070, size.width * 0.9432853, size.height * 0.01000000,
        size.width * 0.9210667, size.height * 0.01000000);
    path_0.lineTo(size.width * 0.07893227, size.height * 0.01000000);
    path_0.cubicTo(size.width * 0.05671467, size.height * 0.01000000, size.width * 0.03777120, size.height * 0.07038060,
        size.width * 0.03419120, size.height * 0.1526070);
    path_0.lineTo(size.width * -0.002631821, size.height * 0.9983890);
    path_0.lineTo(size.width * -0.003137360, size.height * 1.010000);
    path_0.lineTo(0, size.height * 1.010000);
    path_0.lineTo(size.width, size.height * 1.010000);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.005333333;
    paint0Stroke.color = const Color(0xffE5E5EA).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF2F2F7).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
