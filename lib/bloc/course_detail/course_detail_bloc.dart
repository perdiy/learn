// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/course_datasource.dart';
import '../../data/models/courses_detail/course_detail_response_model.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';
part 'course_detail_bloc.freezed.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  final CourseDataSource dataSource;
  CourseDetailBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getDetailCourse(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
