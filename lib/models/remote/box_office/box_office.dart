import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_key.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_details.dart';
import 'package:retrofit/retrofit.dart';

part 'box_office.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BoxOfficeApi {
  factory BoxOfficeApi(Dio dio, {String baseUrl}) = _BoxOfficeApi;

  @GET("BoxOffice/{apiKey}")
  Future<BoxOfficeDetails> getBoxOffice({@Path() final String apiKey = apiKey});

  @GET("BoxOfficeAllTime/{apiKey}")
  Future<BoxOfficeOfAllTimeDetails> getBoxOfficeAllTime(
      {@Path() final String apiKey = apiKey});
}
