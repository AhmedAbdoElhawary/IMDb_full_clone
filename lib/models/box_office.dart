import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_details.dart';
import 'package:retrofit/retrofit.dart';

import '../helper/utility/constant.dart';

part 'box_office.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BoxOfficeApi {
  factory BoxOfficeApi(Dio dio, {String baseUrl}) = _BoxOfficeApi;

  @GET("BoxOffice/{apiKey}")
  Future<List<BoxOfficeDetails>> getBoxOffice({@Path() String apiKey = apiKey});

  @GET("BoxOfficeAllTime/{apiKey}")
  Future<List<BoxOfficeOfAllTimeDetails>> getBoxOfficeAllTime(
      {@Path() String apiKey = apiKey});
}
