// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/datasource/course_datasource.dart';
import '../../data/models/courses/course_response_model.dart';

part 'course_event.dart';
part 'course_state.dart';
part 'course_bloc.freezed.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseDataSource dataSource;
  CourseBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getCourse();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
