import 'package:course_app/models/categoria.dart';
import 'package:course_app/models/recurso.dart';
import 'package:course_app/repositories/recurso_api.dart';
import 'package:get/get.dart';

class HomeControllerG extends GetxController {
  final categories = List<Categoria>().obs;
  final recursos = List<Recurso>().obs;
  final recursosFiltro = List<Recurso>().obs;

  RxString tipo = ''.obs;
  var qtdAluno = 0.obs;
  var qtdProfessor = 0.obs;
  var qtdPlayList = 0.obs;
  var qtdAtividade = 0.obs;
  var qtdEquipe = 0.obs;
  var qtdProblema = 0.obs;
  var query = "".obs;

  HomeControllerG(this.api);
  final RecursoAPI api;

  @override
  void onInit() {
    getQtdRecursos();
    super.onInit();
  }

  filtrarTipo() async {
    recursos.value = await api.getRecursos();
    recursos.value =
        recursos.where((element) => element.publico == query.value).toList();
  }

  Future<List<Recurso>> search(String search) async {
    recursosFiltro.value = recursos
        .where((element) =>
            element.titulo.toLowerCase().contains(search.toLowerCase()))
        .toList();
    return Future.delayed(Duration(milliseconds: 800)).then((value) {
      return recursosFiltro.value;
    });
  }

  getQtdRecursos() async {
    recursos.value = await api.getRecursos();

    qtdAluno.value =
        recursos.where((element) => element.publico == 'aluno').toList().length;

    qtdProfessor.value = recursos
        .where((element) => element.publico == 'professor')
        .toList()
        .length;

    qtdEquipe.value = recursos
        .where((element) => element.publico == 'equipe')
        .toList()
        .length;

    qtdProblema.value = recursos
        .where((element) => element.categoria == 'Solução de problemas')
        .toList()
        .length;

    qtdPlayList.value = recursos
        .where((element) => element.categoria == 'Playlist')
        .toList()
        .length;

    qtdAtividade.value = recursos
        .where((element) => element.categoria == 'ClassRoom Atividades')
        .toList()
        .length;

    var categoriesData = [
      {
        "name": "Professor",
        'courses': qtdProfessor.value,
        'image': "assets/images/professor.png"
      },
      {
        "name": "Aluno",
        'courses': qtdAluno.value,
        'image': "assets/images/aluno.png"
      },
      {
        "name": "Atividades",
        'courses': qtdAtividade.value,
        'image': "assets/images/forms.png"
      },
      {
        "name": "Problemas",
        'courses': qtdProblema.value,
        'image': "assets/images/problema.png"
      },
      {
        "name": "Normas",
        'courses': qtdEquipe.value,
        'image': "assets/images/equipe.png"
      },
      {
        "name": "Playlist",
        'courses': qtdPlayList.value,
        'image': "assets/images/playlist.png"
      },
    ];

    categories.value = categoriesData
        .map((item) => Categoria(item['name'], item['courses'], item['image']))
        .toList();
  }
}
