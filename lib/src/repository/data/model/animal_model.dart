import 'package:json_annotation/json_annotation.dart';

part 'animal_model.g.dart';

@JsonSerializable(createToJson: false)
class AnimalCardResponse {
  const AnimalCardResponse({
    required this.id,
    required this.name,
    required this.species,
    required this.age,
    required this.content,
    required this.image,
  });

  factory AnimalCardResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalCardResponseFromJson(json);

  final int id;
  final String name;
  final String species;
  final int age;
  final String content;
  final String? image;
}