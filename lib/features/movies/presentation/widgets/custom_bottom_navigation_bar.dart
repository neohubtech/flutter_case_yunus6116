import 'package:auto_route/auto_route.dart';
import '../../../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../pages/saved_movies_page/saved_movies_page.dart';
import 'custom_bottom_bar_painter.dart';
import 'saved_movie_market.dart';

/// CustomBottomNavigationBar is the bottom navigation bar that is shown in the MainPage.
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
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const SavedMoviesPage();
                            },
                          );
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          Stack(
                            children: [
                              Icon(
                                index == 0 ? Icons.home : Icons.shopping_cart_outlined,
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
