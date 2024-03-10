import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getPolyline(String url, String start, String end) async {
    Dio dio = Dio();

    return await dio.get(url,
        options: Options(
          contentType: "application/json",
          method: "GET",
          responseType: ResponseType.json,
        ),
        queryParameters: {
          'api_key': '5b3ce3597851110001cf62481806099c0c424a3a81c716f09b5d7254',
          'start': start,
          'end': end,
        });
  }
}
// https://api.openrouteservice.org/v2/directions/driving-car&api_key=5b3ce3597851110001cf62481806099c0c424a3a81c716f09b5d7254
// api_key=5b3ce3597851110001cf62481806099c0c424a3a81c716f09b5d7254
// &start=51.391774034090275,35.69616135764569
// &end=51.40330453483685,35.69029070356075