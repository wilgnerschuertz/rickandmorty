import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
