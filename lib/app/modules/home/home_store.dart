import 'package:mobx/mobx.dart';
import 'package:tvShowlist/app/services/tv_shows_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final TvShowsService tvShowsService;

  @observable
  var tvShows;

  @observable
  int pageCounter = 0;

  String get pageCounterView => (pageCounter + 1).toString();

  @observable
  bool isLoading = false;

  HomeStoreBase(this.tvShowsService);

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
}
