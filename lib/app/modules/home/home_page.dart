import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvShowlist/app/models/tv_show_model.dart';
import 'package:tvShowlist/app/modules/home/components/search_widget.dart';
import 'package:tvShowlist/app/modules/home/components/tv_show_tile.dart';
import 'package:tvShowlist/app/modules/home/home_store.dart';

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
        title: Observer(
          builder: (context) => store.searchOn
              ? SearchWidget(searchController: store.searchController)
              : Text('TvShows'),
        ),
        leading: Observer(
          builder: (context) => store.searchOn
              ? IconButton(
                  onPressed: () {
                    store.setSearch(false);
                    store.searchController.clear();
                    store.getPage();
                  },
                  icon: Icon(Icons.close),
                )
              : Container(),
        ),
        actions: [
          IconButton(
            onPressed: () => store.search(),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Observer(
          builder: (context) => store.isLoading
              ? CircularProgressIndicator(color: Colors.blueGrey.shade900)
              : ListView.builder(
                  padding: EdgeInsets.only(top: 5, bottom: 50),
                  itemCount: store.tvShows?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    TvShow tvShow = store.tvShows[index];
                    return Column(
                      children: [
                        TvShowTile(tvShow: tvShow),
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
