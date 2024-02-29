import 'package:dartz/dartz.dart';

import '../models/breed.dart';
import '../repositories/breeds_repository.dart';

class GetBreedsUseCase {
  final BreedsRepository _breedsRepository;

  GetBreedsUseCase(
    this._breedsRepository,
  );

  Future<Either<Fail, List<Breed>>> call() async {
    return await _breedsRepository.getBreeds();
  }
}
