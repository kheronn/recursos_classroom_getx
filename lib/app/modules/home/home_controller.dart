import 'package:course_app/app/model/recurso.dart';
import 'package:course_app/app/repositories/recurso_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../model/category.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<RecursoAPI>();

   @observable
  List<Category> categories = [];

  @observable
  List<Recurso> recursos;

  @observable
  String tipo;

  @observable
  int qtdAluno;

  @observable
  int qtdProfessor;

  @observable
  int qtdPlayList;

  @observable
  int qtdAtividade;

  @observable
  String query;

  _HomeControllerBase() {
    getQtdRecursos();
  }

  @action
  filtrarTipo() async {
    recursos = await api.getRecursos();
    recursos = recursos.where((element) => element.publico == query).toList();
  }

  @action
  getQtdRecursos() async {
    recursos = await api.getRecursos();
    qtdAluno =
        recursos.where((element) => element.publico == 'aluno').toList().length;
   
    qtdProfessor = recursos
        .where((element) => element.publico == 'professor')
        .toList()
        .length;

    qtdPlayList = recursos
        .where((element) => element.categoria == 'Playlist')
        .toList()
        .length;

    qtdAtividade = recursos
        .where((element) => element.categoria == 'ClassRoom Atividades')
        .toList()
        .length;

    var categoriesData = [
      {
        "name": "Professor",
        'courses': qtdProfessor,
        'image': "assets/images/professor.png"
      },
      {
        "name": "Aluno",
        'courses': qtdAluno,
        'image': "assets/images/aluno.png"
      },
      {
        "name": "Atividades",
        'courses': qtdAtividade,
        'image': "assets/images/forms.png"
      },
      {
        "name": "Playlist",
        'courses': qtdPlayList,
        'image': "assets/images/playlist.png"
      },
    ];

    categories = categoriesData
        .map((item) => Category(item['name'], item['courses'], item['image']))
        .toList();
  }
}
