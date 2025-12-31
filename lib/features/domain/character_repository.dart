import 'character_entity.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getAllCharacters();
}
