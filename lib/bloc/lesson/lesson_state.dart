part of 'lesson_bloc.dart';

@freezed
class LessonState with _$LessonState {
  const factory LessonState.initial() = _Initial;
  const factory LessonState.loading() = _Loading;
  const factory LessonState.loaded(List<LessonResponseModel> model) = _Loaded;
  const factory LessonState.error(String message) = _Error;
}
