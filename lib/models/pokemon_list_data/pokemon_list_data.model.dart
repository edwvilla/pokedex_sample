import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_sample/models/pokemon_list_object/pokemon_list_object.model.dart';

part 'pokemon_list_data.model.g.dart';

@JsonSerializable()
class PokemonListData {
  final int count;
  final String next;
  final String? previous;
  final List<PokemonListObject> results;

  PokemonListData({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListData.fromJson(Map<String, dynamic> json) => _$PokemonListDataFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListDataToJson(this);
}
