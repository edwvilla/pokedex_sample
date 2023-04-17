import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_object.model.g.dart';

@JsonSerializable()
class PokemonListObject {
  final String name;
  final String url;

  PokemonListObject({
    required this.name,
    required this.url,
  });

  int getIdByUrl() {
    final splittedUrl = url.split('/');
    return int.parse(splittedUrl[6]);
  }

  factory PokemonListObject.fromJson(Map<String, dynamic> json) =>
      _$PokemonListObjectFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListObjectToJson(this);
}
