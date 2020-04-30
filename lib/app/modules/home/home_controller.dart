import 'package:course_app/app/model/recurso.dart';
import 'package:course_app/app/repositories/recurso_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<RecursoAPI>();

  @observable
  List<Recurso> recursos;

  _HomeControllerBase() {
    getRecursos();
  }

  @action
  getRecursos() async {
    recursos = await api.getRecursos();
    print(recursos);
  }
}
