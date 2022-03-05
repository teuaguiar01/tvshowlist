import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movielist/app/models/movie_model.dart';
import 'package:movielist/app/modules/home/home_store.dart';
import 'package:movielist/app/utils/config.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text('Movies'),
      ),
      body: Center(
        child: Observer(
          builder: (context) => store.isLoading
              ? CircularProgressIndicator(color: Colors.blueGrey.shade900)
              : ListView.builder(
                  padding: EdgeInsets.only(top: 5, bottom: 50),
                  itemCount: store.movies?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Movie movie = store.movies[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 60,
                            width: 40,
                            child: CachedNetworkImage(
                              imageUrl: movie.image?.original ??
                                  AppConfig.noImageAvaiable,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
                              Text(movie.name ?? "undefined"),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
        ),
      ),
      bottomSheet: Observer(
        builder: (context) => Container(
          height: 50,
          color: Colors.blueGrey.shade900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed:
                    store.pageCounter == 0 ? null : () => store.movePage(false),
                icon: Icon(
                  Icons.chevron_left_outlined,
                  color: store.pageCounter == 0 ? Colors.grey : Colors.white,
                ),
              ),
              Text(
                store.pageCounterView,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => store.movePage(true),
                icon: Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
