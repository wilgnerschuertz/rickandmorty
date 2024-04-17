import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/src/character_page/data/datasource/character_remote_datasource.dart';
import 'package:rickandmorty/src/character_page/data/models/character_model.dart';
import 'package:rickandmorty/src/character_page/data/repositories/character_repository_impl.dart';
import 'package:rickandmorty/src/character_page/domain/entities/character.dart';

class MockCharacterRemoteDataSource extends Mock
    implements CharacterRemoteDataSource {}

void main() {
  late MockCharacterRemoteDataSource mockDataSource;
  late CharacterRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockCharacterRemoteDataSource();
    repository = CharacterRepositoryImpl(mockDataSource);
  });

  final tCharacterModel = CharacterModel(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    type: '',
    gender: 'Male',
    image: '',
    episode: [],
    origin: {},
    location: {},
  );

  group('fetchCharacters', () {
    test(
        'should return a list of characters when the call to datasource is successful',
        () async {
      when(mockDataSource.fetchCharacters(1)).thenAnswer((_) async =>
          [tCharacterModel]); // Correct use of thenAnswer for async operation

      final result = await repository.fetchCharacters(1);

      expect(result, isA<List<Character>>());
      expect(result.first.name, equals('Rick Sanchez'));
      verify(mockDataSource.fetchCharacters(1)).called(1);
    });

    test(
        'should throw an exception when the call to datasource is unsuccessful',
        () {
      when(mockDataSource.fetchCharacters(1)).thenThrow(Exception(
          'Failed to fetch')); // Correct use of thenThrow for simulating exceptions

      expect(repository.fetchCharacters(1), throwsA(isA<Exception>()));
    });
  });
}
