import 'package:dartz/dartz.dart';

import '../models/breed.dart';

abstract class BreedsRepository {
  Future<Either<Fail, List<Breed>>> getBreeds();
}
