import 'package:course_app/app/modules/categoria/categoria_controller.dart';
import 'package:course_app/app/modules/categoria/categoria_page.dart';
import 'package:course_app/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:course_app/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => CategoriaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/categoria/:tipo',
            child: (_, args) => CategoriaPage(tipo: args.params['tipo'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
