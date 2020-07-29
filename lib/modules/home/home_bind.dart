import 'package:course_app/repositories/recurso_api.dart';
import 'package:get/get.dart';

import 'home_controllerg.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerG>(() {
      final RecursoAPI api = RecursoAPI();
      return HomeControllerG(api);
    });
  }
}
