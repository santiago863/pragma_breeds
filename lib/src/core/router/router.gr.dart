// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BreedDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BreedDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BreedDetailScreen(
          key: args.key,
          breed: args.breed,
        ),
      );
    },
    BreedsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedsListScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [BreedDetailScreen]
class BreedDetailRoute extends PageRouteInfo<BreedDetailRouteArgs> {
  BreedDetailRoute({
    Key? key,
    required Breed breed,
    List<PageRouteInfo>? children,
  }) : super(
          BreedDetailRoute.name,
          args: BreedDetailRouteArgs(
            key: key,
            breed: breed,
          ),
          initialChildren: children,
        );

  static const String name = 'BreedDetailRoute';

  static const PageInfo<BreedDetailRouteArgs> page =
      PageInfo<BreedDetailRouteArgs>(name);
}

class BreedDetailRouteArgs {
  const BreedDetailRouteArgs({
    this.key,
    required this.breed,
  });

  final Key? key;

  final Breed breed;

  @override
  String toString() {
    return 'BreedDetailRouteArgs{key: $key, breed: $breed}';
  }
}

/// generated route for
/// [BreedsListScreen]
class BreedsListRoute extends PageRouteInfo<void> {
  const BreedsListRoute({List<PageRouteInfo>? children})
      : super(
          BreedsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreedsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
