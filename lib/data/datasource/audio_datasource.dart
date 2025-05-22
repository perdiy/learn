import 'dart:convert';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../common/constants.dart';
import '../models/audio/audio_response_model.dart';

class AudioDataSource {
  // GET Course
  Future<Either<String, List<AudioResponseModel>>> getAudio() async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}audio',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      final List<AudioResponseModel> forum =
          data.map((item) => AudioResponseModel.fromJson(item)).toList();
      return Right(forum);
    } else {
      return const Left('API ERROR');
    }
  }
}
