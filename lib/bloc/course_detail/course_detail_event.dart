part of 'course_detail_bloc.dart';

@freezed
class CourseDetailEvent with _$CourseDetailEvent {
  const factory CourseDetailEvent.started() = _Started;
  const factory CourseDetailEvent.get(String id) = _Get;
}
