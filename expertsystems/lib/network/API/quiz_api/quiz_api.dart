import 'package:expertsystems/service/responses/question/question.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'quiz_api.g.dart';

@RestApi(baseUrl: 'http://localhost:8080')
abstract class QuestionRest {
  factory QuestionRest(Dio dio, {String baseUrl}) = _QuestionRest;

  @GET('/question')
  Future<List<Question>> queryQuestion();
}
