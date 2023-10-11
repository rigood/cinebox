import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cinebox/models/movie_model.dart';
import 'package:cinebox/models/movie_detail_model.dart';

class ApiService {
  static const String baseUrl = "https://ovies-api.nomadcoders.workers.dev";
  static const String detail = "movie?id=";

  static Future<List<MovieModel>> getMovies(movieListName) async {
    List<MovieModel> movieList = [];

    final url = Uri.parse('$baseUrl/$movieListName');
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body)['results'];

        for (var json in jsonList) {
          final movie = MovieModel.fromJson(json);
          movieList.add(movie);
        }

        return movieList;
      } else {
        return Future.error("${response.statusCode} 에러 발생");
      }
    } catch (error) {
      return Future.error("에러 발생");
    }
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$baseUrl/$detail$id");
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MovieDetailModel.fromJson(json);
      } else {
        return Future.error("${response.statusCode} 에러 발생");
      }
    } catch (error) {
      return Future.error("에러 발생");
    }
  }
}
