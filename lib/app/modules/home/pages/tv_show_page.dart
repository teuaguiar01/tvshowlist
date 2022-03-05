import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvShowlist/app/models/tv_show_model.dart';
import 'package:tvShowlist/app/modules/home/pages/tv_show_store.dart';
import 'package:tvShowlist/app/utils/config.dart';

class TvShowPage extends StatefulWidget {
  TvShowPage(this.tvShow);

  final TvShow tvShow;

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends ModularState<TvShowPage, TvShowStore> {
  @override
  void initState() {
    super.initState();
    store.setTvShow(widget.tvShow);
    store.getPage();
    store.episodeCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(widget.tvShow.title),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withOpacity(0.2),
                  child: CachedNetworkImage(
                    imageUrl: widget.tvShow.image?.original ??
                        AppConfig.noImageAvaiable,
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
                            text: widget.tvShow.title,
                            style: TextStyle(fontWeight: FontWeight.w500)),
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
                          text: widget.tvShow.schedule?.days?.join(', '),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        if (widget.tvShow.schedule?.time?.isNotEmpty ?? false)
                          TextSpan(
                            text: ', ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        TextSpan(
                          text: widget.tvShow.schedule?.time,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: RichText(
                    text: TextSpan(
                      text: 'Genres: ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(
                            text:
                                widget.tvShow.genres?.join(', ') ?? 'Undefined',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Html(data: widget.tvShow.summary),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                    "Episodes",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                store.isLoading
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: store.seasonList?.length ?? 0,
                        itemBuilder: (ctx, idx) {
                          final season = store.seasonList[idx];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Season ${season['number']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: store.episodeList
                                        ?.where((episode) =>
                                            episode.season == season['number'])
                                        .length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final episode =
                                      store.episodeList[store.episodeCounter];
                                  store.episodeCounter++;
                                  return ListTile(
                                    title: GestureDetector(
                                      onTap: () => _showMyDialog(episode),
                                      child: Text(episode!.name ?? 'Undefined'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(Episode episode) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${episode.name}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (episode.image != null && episode.image!.medium != null)
                  CachedNetworkImage(
                    height: 60,
                    width: 40,
                    imageUrl: episode.image!.medium!,
                    placeholder: (_, __) => Center(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ),
                  ),
                Text('Number: ${episode.number}'),
                Text('Season: ${episode.season}'),
                Html(data: episode.summary),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(primary: Colors.blueGrey.shade900),
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
