import 'package:cubit_practice/features/data/models/info.dart';
import 'package:json_annotation/json_annotation.dart';

import 'character.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  final Info info;
  final List<Character> results;

  CharacterResponseModel({required this.info, required this.results});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);
}
