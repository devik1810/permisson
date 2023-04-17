import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permisson/screen/model/gameofthr_model.dart';

class MovieHelper {
  Future<MovieModel> Moviesapi() async {
    String movieLink =
        "https://imdb8.p.rapidapi.com/auto-complete?q=game%20of%20thr";

    Uri uri = Uri.parse(movieLink);
    var resonse = await http.get(uri, headers: {
      "X-RapidAPI-Key": "9d67cc4cb8msh1c6886a63a86fffp10c741jsnd484d5b63dbc",
      "X-RapidAPI-Host": "imdb8.p.rapidapi.com"
    });
    var json = jsonDecode(resonse.body);

    MovieModel moviewModel = MovieModel.fromJson(json);
    return moviewModel;
  }
}
