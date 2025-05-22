import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_response_model.freezed.dart';
part 'audio_response_model.g.dart';

@freezed
class AudioResponseModel with _$AudioResponseModel {
  const factory AudioResponseModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "artist") required String artist,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "isPremium") required String isPremium,
    @JsonKey(name: "languange") required String languange,
    @JsonKey(name: "path") required List<Path> path,
    @JsonKey(name: "thumbnail") required List<Path> thumbnail,
    @JsonKey(name: "time") required dynamic time,
    @JsonKey(name: "title") required String title,
  }) = _AudioResponseModel;

  factory AudioResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AudioResponseModelFromJson(json);
}

@freezed
class Path with _$Path {
  const factory Path({
    @JsonKey(name: "fileName") required String fileName,
    @JsonKey(name: "url") required String url,
  }) = _Path;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);
}
