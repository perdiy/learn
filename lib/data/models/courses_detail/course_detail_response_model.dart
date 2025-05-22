import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_detail_response_model.freezed.dart';
part 'course_detail_response_model.g.dart';

@freezed
class CourseDetailResponseModel with _$CourseDetailResponseModel {
  const factory CourseDetailResponseModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "author") required dynamic author,
    @JsonKey(name: "category") required dynamic category,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "path") required List<Path> path,
    @JsonKey(name: "title") required String title,
  }) = _CourseDetailResponseModel;

  factory CourseDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailResponseModelFromJson(json);
}

@freezed
class Path with _$Path {
  const factory Path({
    @JsonKey(name: "fileName") required String fileName,
    @JsonKey(name: "url") required String url,
  }) = _Path;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);
}
