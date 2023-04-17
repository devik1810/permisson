import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permisson/screen/provider/movie_provider.dart';
import 'package:permisson/screen/view/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => HomeSecreen()},
      ),
    ),
  );
}
