import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_response_model.freezed.dart';
part 'lesson_response_model.g.dart';

@freezed
class LessonResponseModel with _$LessonResponseModel {
  const factory LessonResponseModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "path") required List<Path> path,
    @JsonKey(name: "title") required String title,
  }) = _LessonResponseModel;

  factory LessonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LessonResponseModelFromJson(json);
}

@freezed
class Path with _$Path {
  const factory Path({
    @JsonKey(name: "fileName") required String fileName,
    @JsonKey(name: "url") required String url,
  }) = _Path;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);
}
