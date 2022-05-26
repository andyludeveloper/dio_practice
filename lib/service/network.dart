import 'package:dio/dio.dart';

class Network {
  Future<String> getData() async {
    var data = "";
    var dio = Dio(); // with default Options
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    try {
      final response = await dio.get("posts/1/comments");
      if (response.statusCode == 200) {
        data = response.data.toString();
      } else {
        data = "fail";
      }
    } on DioError catch (e) {
      data = "No network: " + e.toString();
    }
    return data;
  }
}
