//ignore_for_file: public_member_api_docs
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

/// AppRouter is the class that is responsible for the routing.
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: MainRoute.page,
          path: '/',
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'saved-movies',
              page: SavedMoviesRoute.page,
            ),
          ],
        ),
      ];
}
