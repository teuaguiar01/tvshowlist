import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvShowlist/app/modules/home/home_store.dart';
import 'package:tvShowlist/app/modules/home/pages/tv_show_page.dart';
import 'package:tvShowlist/app/modules/home/pages/tv_show_store.dart';
import 'package:tvShowlist/app/services/tv_shows_service.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(TvShowsService())),
    Bind.lazySingleton((i) => TvShowStore(TvShowsService())),
    Bind.lazySingleton((i) => TvShowsService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/tvShow', child: (context, args) => TvShowPage(args.data)),
  ];
}
