import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movielist/app/models/movie_model.dart';
import 'package:movielist/app/utils/config.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/movie', arguments: movie),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 40,
          child: CachedNetworkImage(
            imageUrl: movie.image?.original ?? AppConfig.noImageAvaiable,
            errorWidget: (context, url, error) => Icon(Icons.error),
            placeholder: (c, u) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title),
          ],
        ),
      ),
    );
  }
}
