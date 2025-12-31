import 'package:cubit_practice/core/constants/api_sevices.dart';

import '../models/character_response_model.dart';

abstract class CharactersRemoteDataSource {
  Future<CharacterResponseModel> getCharacters();
}

class CharactersRemoteDataSourceImpl extends CharactersRemoteDataSource {
  final ApiService apiService;

  CharactersRemoteDataSourceImpl(this.apiService);

  @override
  Future<CharacterResponseModel> getCharacters() async {
    final data = await apiService.get(endPoint: 'character');
    return CharacterResponseModel.fromJson(data);
  }
}
