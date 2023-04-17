import 'package:flutter/material.dart';
import 'package:permisson/screen/model/gameofthr_model.dart';
import 'package:permisson/screen/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({Key? key}) : super(key: key);

  @override
  State<HomeSecreen> createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  MoviesProvider? moviesProviderT;
  MoviesProvider? moviesProviderF;

  @override
  Widget build(BuildContext context) {
    moviesProviderT = Provider.of<MoviesProvider>(context, listen: true);
    moviesProviderF = Provider.of<MoviesProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Text(
            "Movies",
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.black26,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: moviesProviderT!.getMovie(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      MovieModel? r1 = snapshot.data;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: r1.d[index].i == null
                                          ? Image.network(
                                              "http://jiroyowa.cocolog-nifty.com/blog/photos/uncategorized/2016/05/09/20160509_gameofthr1.jpg")
                                          : Image.network(
                                              r1.d[index].i!.imageUrl)),
                                  SizedBox(width: 15),
                                  Center(
                                    child: Container(
                                      width: 170,
                                      child: Text(
                                        "${r1.d[index].l}",
                                        style: TextStyle(fontSize: 15,color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Text("${r1.d[index].rank}"),
                              // SizedBox(height: 10)
                            ],
                          );
                        },
                        itemCount: r1!.d.length,
                      );
                    }
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
