import 'dart:convert';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../common/constants.dart';
import '../models/courses/course_response_model.dart';
import '../models/courses_detail/course_detail_response_model.dart';

class CourseDataSource {
  // GET Course
  Future<Either<String, List<CourseResponseModel>>> getCourse() async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}courses?\$lookup=*',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      final List<CourseResponseModel> forum =
          data.map((item) => CourseResponseModel.fromJson(item)).toList();
      return Right(forum);
    } else {
      return const Left('API ERROR');
    }
  }

  // GET DETAIL COURSE
  Future<Either<String, CourseDetailResponseModel>> getDetailCourse(
      String id) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}courses/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        CourseDetailResponseModel.fromJson(jsonDecode(response.body)),
      );
    } else {
      dynamic json = jsonDecode(response.body);
      String message = json['message'];
      return Left(message);
    }
  }
}
