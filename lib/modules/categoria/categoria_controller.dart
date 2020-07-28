import 'package:course_app/app/model/recurso.dart';
import 'package:course_app/app/repositories/recurso_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaBase with _$CategoriaController;

abstract class _CategoriaBase with Store {
  final api = Modular.get<RecursoAPI>();

  @observable
  List<Recurso> recursos;

  @observable
  String tipo;

  @action
  filtrar() async {
       recursos = await api.getRecursos();
    if (tipo == 'Aluno' || tipo == 'Professor') {
      recursos = recursos
          .where((element) => element.publico == tipo.toLowerCase())
          .toList().reversed.toList();
    } else {
      if (tipo.toLowerCase() == 'normas') {
        tipo = "equipe";
         recursos = recursos
          .where((element) => element.publico == tipo.toLowerCase())
          .toList().reversed.toList().reversed.toList().reversed.toList();
          return;
      }
      if (tipo.toLowerCase() == 'atividades') {
        tipo = "ClassRoom Atividades";
      }
      if (tipo.toLowerCase() == 'problemas') {
        tipo = "Solução de problemas";
      }
      if (tipo.toLowerCase() == 'formação') {
        tipo = "Formação";
      }
      recursos =
          recursos.where((element) => element.categoria == tipo).toList().reversed.toList();
    }
  }
}
