import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_response_model.freezed.dart';
part 'course_response_model.g.dart';

@freezed
class CourseResponseModel with _$CourseResponseModel {
  const factory CourseResponseModel({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "author") String? author,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "chapter") List<Chapter>? chapter,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "path") List<Path>? path,
    @JsonKey(name: "title") String? title,
  }) = _CourseResponseModel;

  factory CourseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseModelFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

@freezed
class Path with _$Path {
  const factory Path({
    @JsonKey(name: "fileName") String? fileName,
    @JsonKey(name: "url") String? url,
  }) = _Path;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);
}
