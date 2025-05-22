part of 'course_detail_bloc.dart';

@freezed
class CourseDetailState with _$CourseDetailState {
  const factory CourseDetailState.initial() = _Initial;
  const factory CourseDetailState.loading() = _Loading;
  const factory CourseDetailState.laoded(CourseDetailResponseModel model) =
      _Loaded;
  const factory CourseDetailState.error(String message) = _Error;
}
