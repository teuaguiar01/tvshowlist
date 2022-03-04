import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movielist/app/utils/config.dart';

class MoviesService extends Disposable {
  final _dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

  Future getData(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print("Error in URL");
    }
  }

  @override
  void dispose() {}
}
