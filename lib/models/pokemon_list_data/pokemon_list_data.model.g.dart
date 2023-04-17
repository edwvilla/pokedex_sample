// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_data.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListData _$PokemonListDataFromJson(Map<String, dynamic> json) =>
    PokemonListData(
      count: json['count'] as int,
      next: json['next'] as String,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonListObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListDataToJson(PokemonListData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
