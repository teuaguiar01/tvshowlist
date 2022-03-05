import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvShowlist/app/models/tv_show_model.dart';
import 'package:tvShowlist/app/utils/config.dart';

class TvShowsService extends Disposable {
  final _dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

  Future getData(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data.map((tvShow) => TvShow.fromJson(tvShow)).toList();
    } else {
      print("Error in URL");
      return [];
    }
  }

  Future getSearch(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data.map((element) => TvShow.fromJson(element['show'])).toList();
    } else {
      print("Error in URL");
      return [];
    }
  }

  Future getEpisodes(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data.map((episode) => Episode.fromJson(episode)).toList();
    } else {
      print("Error in URL");
      return [];
    }
  }

  Future getSeasons(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print("Error in URL");
      return [];
    }
  }

  @override
  void dispose() {}
}
