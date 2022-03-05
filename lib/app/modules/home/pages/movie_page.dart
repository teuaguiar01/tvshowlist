import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movielist/app/models/movie_model.dart';
import 'package:movielist/app/utils/config.dart';

class MoviePage extends StatelessWidget {
  MoviePage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.black.withOpacity(0.2),
                child: CachedNetworkImage(
                  imageUrl: movie.image?.original ?? AppConfig.noImageAvaiable,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: RichText(
                  text: TextSpan(
                    text: 'Title: ',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    children: [
                      TextSpan(
                          text: movie.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: RichText(
                  text: TextSpan(
                    text: 'Times: ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(
                        text: movie.schedule?.days?.join(', '),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (movie.schedule?.time?.isNotEmpty ?? false)
                        TextSpan(
                          text: ', ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      TextSpan(
                        text: movie.schedule?.time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
