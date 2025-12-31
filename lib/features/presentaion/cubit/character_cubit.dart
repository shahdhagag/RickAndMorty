import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/character_entity.dart';
import '../../domain/character_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository repository;

  CharacterCubit(this.repository) : super(CharacterInitial());

  // 🟢 original list (المصدر الأساسي)
  List<CharacterEntity> _allCharacters = [];

  /// Fetch characters from repository
  Future<void> getCharacters() async {
    emit(CharacterLoading());
    try {
      final List<CharacterEntity> characters = await repository
          .getAllCharacters();

      _allCharacters = characters;

      emit(CharacterLoaded(characters: characters));
    } catch (e) {
      emit(CharacterError(message: e.toString()));
    }
  }

  /// 🔍 Search characters by name
  void searchCharacters(String query) {
    if (query.isEmpty) {
      emit(CharacterLoaded(characters: _allCharacters));
      return;
    }

    final filteredCharacters = _allCharacters.where((character) {
      return character.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(CharacterLoaded(characters: filteredCharacters));
  }

  /// ❌ Clear search
  void clearSearch() {
    emit(CharacterLoaded(characters: _allCharacters));
  }
}
