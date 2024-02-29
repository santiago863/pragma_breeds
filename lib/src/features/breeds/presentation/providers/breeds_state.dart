import '../../domain/models/breed.dart';

class BreedsState {
  final bool loading;
  final String query;
  final List<Breed> allBreeds;
  final List<Breed> filterBreeds;

  BreedsState({
    this.loading = false,
    this.query = '',
    this.allBreeds = const [],
    this.filterBreeds = const [],
  });

  BreedsState copyWith({
    bool? loading,
    String? query,
    List<Breed>? allBreeds,
    List<Breed>? filterBreeds,
  }) {
    return BreedsState(
      loading: loading ?? this.loading,
      query: query ?? this.query,
      allBreeds: allBreeds ?? this.allBreeds,
      filterBreeds: filterBreeds ?? this.filterBreeds,
    );
  }
}
