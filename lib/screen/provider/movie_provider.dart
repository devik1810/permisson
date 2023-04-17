import 'package:flutter/foundation.dart';
import 'package:permisson/screen/model/gameofthr_model.dart';
import 'package:permisson/utils/movie_helper.dart';

class MoviesProvider extends ChangeNotifier {


 Future<MovieModel> getMovie() async {
   MovieHelper movieHelper = MovieHelper();
   MovieModel movieModel =  await movieHelper.Moviesapi();
   return movieModel;
}


}