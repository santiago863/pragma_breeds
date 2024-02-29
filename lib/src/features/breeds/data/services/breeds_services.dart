import 'package:dio/dio.dart';

import '../../domain/models/breed.dart';

abstract class BreedsServices {
  Future<List<Breed>> getBreeds();
}

class BreedsServicesImpl implements BreedsServices {
  final Dio _dio;

  BreedsServicesImpl(
    this._dio,
  );

  @override
  Future<List<Breed>> getBreeds() async {
    final List<Breed> breeds = [];
    final response = await _dio.get(
      '/v1/breeds',
    );
    for (var breedData in response.data) {
      breeds.add(
        Breed.fromJson(breedData),
      );
    }
    return breeds;
  }
}
