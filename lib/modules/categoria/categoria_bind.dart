import 'package:course_app/modules/categoria/categoria_controllerg.dart';
import 'package:course_app/repositories/recurso_api.dart';
import 'package:get/get.dart';

class CategoriaBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriaControllerG>(() {
      final RecursoAPI api = RecursoAPI();
      return CategoriaControllerG(api);
    });
  }
}
