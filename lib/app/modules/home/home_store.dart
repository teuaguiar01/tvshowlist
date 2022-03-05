import 'package:mobx/mobx.dart';
import 'package:movielist/app/services/movies_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final MoviesService moviesService;

  @observable
  var movies;

  @observable
  int pageCounter = 0;

  String get pageCounterView => (pageCounter + 1).toString();

  @observable
  bool isLoading = false;

  HomeStoreBase(this.moviesService);

  @action
  Future<void> getPage() async {
    setLoading(true);
    try {
      movies = (await moviesService.getData("/shows?page=$pageCounter"));
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
