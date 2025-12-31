import '../../domain/character_entity.dart';
import '../../domain/character_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/character_response_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;

  CharactersRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    // جلب البيانات من RemoteDataSource
    final CharacterResponseModel response = await remoteDataSource
        .getCharacters();

    // تحويل الـ Model لـ Entity
    final List<CharacterEntity> characters = response.results
        .map(
          (characterModel) => CharacterEntity(
            id: characterModel.id,
            name: characterModel.name,
            status: characterModel.status,
            species: characterModel.species,
            type: characterModel.type,
            gender: characterModel.gender,
            originName: characterModel.origin.name,
            locationName: characterModel.location.name,
            image: characterModel.image,
          ),
        )
        .toList();

    return characters;
  }
}
