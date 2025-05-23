import 'dart:convert';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../common/constants.dart';
import '../models/lesson/lesson_response_model.dart';

class LessonDataSource {
  // GET LESSON
  Future<Either<String, List<LessonResponseModel>>> getLesson() async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}lesson',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      final List<LessonResponseModel> forum =
          data.map((item) => LessonResponseModel.fromJson(item)).toList();
      return Right(forum);
    } else {
      return const Left('API ERROR');
    }
  }
}
