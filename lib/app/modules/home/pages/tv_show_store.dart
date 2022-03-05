import 'package:mobx/mobx.dart';
import 'package:tvShowlist/app/models/tv_show_model.dart';
import 'package:tvShowlist/app/services/tv_shows_service.dart';

part 'tv_show_store.g.dart';

class TvShowStore = TvShowStoreBase with _$TvShowStore;

abstract class TvShowStoreBase with Store {
  final TvShowsService tvShowsService;

  @observable
  TvShow? tvShow;

  @observable
  var episodeList;

  @observable
  var seasonList;

  @observable
  bool isLoading = false;

  TvShowStoreBase(this.tvShowsService);

  @action
  setTvShow(TvShow m) => tvShow = m;

  @action
  Future<void> getPage() async {
    setLoading(true);
    try {
      seasonList =
          await tvShowsService.getEpisodes("/shows/${tvShow!.id}/seasons");
      episodeList =
          await tvShowsService.getEpisodes("/shows/${tvShow!.id}/episodes");
    } catch (e) {
      print(e);
    }
    setLoading(false);
  }

  @action
  setLoading(bool b) => isLoading = b;
}
