import 'package:course_app/app/modules/home/home_controllerg.dart';
import 'package:course_app/app/repositories/recurso_api.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerG>(() {
      final RecursoAPI api = RecursoAPI();
      return HomeControllerG(api);
    });
  }
}
