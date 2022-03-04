import 'package:flutter_modular/flutter_modular.dart';
import 'package:movielist/app/modules/home/home_store.dart';
import 'package:movielist/app/services/movies_service.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(MoviesService())),
    Bind.lazySingleton((i) => MoviesService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
