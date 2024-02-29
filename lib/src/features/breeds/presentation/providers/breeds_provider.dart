import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pragma_breeds/src/core/router/router.dart';
import 'package:pragma_breeds/src/core/utils/message_utils.dart';
import 'package:pragma_breeds/src/features/breeds/data/repositories/breeds_repository_impl.dart';
import 'package:pragma_breeds/src/features/breeds/data/services/breeds_services.dart';
import 'package:pragma_breeds/src/features/breeds/domain/usecases/get_breeds_use_case.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/repositories/breeds_repository.dart';
import 'breeds_state.dart';

final breedsServiceProvider = Provider<BreedsServices>((ref) {
  return BreedsServicesImpl(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com',
        headers: {
          'x-api-key': dotenv.env['PRAGMA_API_KEY'],
        },
      ),
    ),
  );
});

final breedsRepositoryProvider = Provider<BreedsRepository>((ref) {
  final service = ref.read(breedsServiceProvider);
  return BreedsRepositoryImpl(service);
});

final getBreedsUseCaseProvider = Provider<GetBreedsUseCase>((ref) {
  final repository = ref.read(breedsRepositoryProvider);
  return GetBreedsUseCase(repository);
});

final breedsProvider =
    StateNotifierProvider<BreedsNotifier, BreedsState>((ref) {
  final getBreeds = ref.read(getBreedsUseCaseProvider);

  return BreedsNotifier(
    getBreeds,
  );
});

class BreedsNotifier extends StateNotifier<BreedsState> {
  final GetBreedsUseCase _getBreedsUseCase;

  BreedsNotifier(
    this._getBreedsUseCase,
  ) : super(
          BreedsState(),
        );

  void init(
    BuildContext context,
  ) {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        context.router.pushAll([
          const BreedsListRoute(),
        ]);
      },
    );
  }

  Future<void> getBreeds(
    BuildContext context,
  ) async {
    if (state.allBreeds.isEmpty) {
      Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () async {
          state = state.copyWith(
            loading: true,
          );
          final result = await _getBreedsUseCase.call();
          state = state.copyWith(
            loading: false,
          );
          result.fold(
            (fail) {
              MessageUtils(context).showSnackBar(
                fail.toString(),
              );
            },
            (breeds) {
              state = state.copyWith(
                allBreeds: breeds,
                filterBreeds: breeds,
              );
            },
          );
        },
      );
    }
  }

  void searchBreeds(
    String query,
  ) {
    if (query.isEmpty) {
      state = state.copyWith(
        query: query,
        filterBreeds: state.allBreeds,
      );
    } else {
      final breeds = state.allBreeds.where(
        (breed) {
          return breed.name.toLowerCase().contains(
                query.toLowerCase(),
              );
        },
      );
      state = state.copyWith(
        query: query,
        filterBreeds: breeds.toList(),
      );
    }
  }

  void restarSearch() {
    state = state.copyWith(
      query: '',
      filterBreeds: state.allBreeds,
    );
  }
}
