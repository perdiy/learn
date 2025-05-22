part of 'course_bloc.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;
  const factory CourseState.loading() = _Loading;
  const factory CourseState.loaded(List<CourseResponseModel> model) = _Loaded;
  const factory CourseState.error(String message) = _Error;
}
