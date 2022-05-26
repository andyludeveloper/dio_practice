import 'package:dio/dio.dart';

class Network {
  Future<dynamic> get(path) async {
    var data;
    var dio = Dio(); // with default Options
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    dio.options.responseType = ResponseType.plain;
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        data = response.data;
      } else {
        throw Exception("Data incorrect");
      }
    return data;
  }
}