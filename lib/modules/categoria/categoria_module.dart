import 'package:course_app/app/modules/categoria/categoria_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:course_app/app/modules/categoria/categoria_page.dart';

class CategoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoriaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CategoriaPage()),
      ];

  static Inject get to => Inject<CategoriaModule>.of();
}
