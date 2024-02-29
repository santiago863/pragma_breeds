import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/breeds/domain/models/breed.dart';
import '../../features/breeds/presentation/pages/breed_detail.dart';
import '../../features/breeds/presentation/pages/breeds_list_screen.dart';
import '../../features/breeds/presentation/pages/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: BreedsListRoute.page,
        ),
        AutoRoute(
          page: BreedDetailRoute.page,
        ),
      ];
}
