import 'package:dartz/dartz.dart';

import '../../domain/models/breed.dart';
import '../../domain/repositories/breeds_repository.dart';
import '../services/breeds_services.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedsServices _breedsServices;

  BreedsRepositoryImpl(
    this._breedsServices,
  );

  @override
  Future<Either<Fail, List<Breed>>> getBreeds() async {
    try {
      final breeds = await _breedsServices.getBreeds();
      return Right(breeds);
    } catch (e) {
      return Left(
        Fail(
          'getBreeds error: $e',
        ),
      );
    }
  }
}
