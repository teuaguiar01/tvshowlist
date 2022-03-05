import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:tvShowlist/app/services/tv_shows_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final TvShowsService tvShowsService;

  TextEditingController searchController = TextEditingController();

  @observable
  bool searchOn = false;

  @observable
  var tvShows;

  @observable
  int pageCounter = 0;

  String get pageCounterView => (pageCounter + 1).toString();

  @observable
  bool isLoading = false;

  HomeStoreBase(this.tvShowsService);

  @action
  search() async {
    setLoading(true);
    if (searchOn) {
      try {
        tvShows = await tvShowsService
            .getSearch('/search/shows?q=${searchController.text}');
      } catch (e) {
        print(e);
      }
    } else {
      setSearch(true);
    }
    setLoading(false);
  }

  @action
  Future<void> getPage() async {
    setLoading(true);
    try {
      tvShows = (await tvShowsService.getData("/shows?page=$pageCounter"));
    } catch (e) {
      print(e);
    }
    setLoading(false);
  }

  @action
  movePage(bool up) {
    if (up)
      pageCounter++;
    else
      pageCounter--;
    getPage();
  }

  @action
  setLoading(bool b) => isLoading = b;

  @action
  setSearch(bool b) => searchOn = b;
}
