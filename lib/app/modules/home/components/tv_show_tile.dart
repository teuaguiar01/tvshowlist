import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvShowlist/app/models/tv_show_model.dart';
import 'package:tvShowlist/app/utils/config.dart';

class TvShowTile extends StatelessWidget {
  const TvShowTile({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/tvShow', arguments: tvShow),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 40,
          child: CachedNetworkImage(
            imageUrl: tvShow.image?.original ?? AppConfig.noImageAvaiable,
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
            Text(tvShow.title),
          ],
        ),
      ),
    );
  }
}
