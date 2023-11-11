import 'package:dio/dio.dart';
import 'package:pogos_app/src/repository/data/model/animal_model.dart';
import 'package:retrofit/http.dart';

part 'animal_page_service.g.dart';

@RestApi(baseUrl:'https://red-store.site/')
abstract class AnimalPageService{
  factory AnimalPageService(Dio dio, {String baseUrl}) = _AnimalPageService;

  @GET('api/animals/')
  Future <List<AnimalCardResponse>> getCard({
    @Query('q') required String query
});
}