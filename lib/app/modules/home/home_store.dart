import 'package:mobx/mobx.dart';
import 'package:movielist/app/services/movies_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final MoviesService moviesService;

  @observable
  int counter = 0;

  HomeStoreBase(this.moviesService);

  Future<void> increment() async {
    counter = counter + 1;
    final data = await moviesService.getData("/shows?page=0");
  }
}
