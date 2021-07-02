import 'package:dio/dio.dart';
import 'package:rest_api/ApiModule/api_client.dart';
import 'package:rest_api/Model/user.dart';
import 'package:retrofit/http.dart';
part 'api_router.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiRouter {
  factory ApiRouter(Dio dio, {String baseUrl}) = _ApiRouter;

  @GET(ApiClient.users)
  Future<ResponseData> getUsers();
}
