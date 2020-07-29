import 'package:course_app/models/recurso.dart';
import 'package:course_app/repositories/recurso_api.dart';
import 'package:get/get.dart';

class CategoriaControllerG extends GetxController {
  CategoriaControllerG(this.api);
  final RecursoAPI api;

  final recursos = List<Recurso>().obs;

  RxString tipo = ''.obs;

  @override
  void onInit() {
    tipo.value = Get.parameters['tipo'];
    print(tipo.value);
    filtrar();
    super.onInit();
  }

  filtrar() async {
    recursos.value = await api.getRecursos();
    if (tipo.value == 'Aluno' || tipo.value == 'Professor') {
      recursos.value = recursos
          .where((element) => element.publico == tipo.value.toLowerCase())
          .toList()
          .reversed
          .toList();
    } else {
      if (tipo.value.toLowerCase() == 'normas') {
        tipo.value = "equipe";
        recursos.value = recursos
            .where((element) => element.publico == tipo.value.toLowerCase())
            .toList()
            .reversed;
        return;
      }
      if (tipo.value.toLowerCase() == 'atividades') {
        tipo.value = "ClassRoom Atividades";
      }
      if (tipo.value.toLowerCase() == 'problemas') {
        tipo.value = "Solução de problemas";
      }
      if (tipo.value.toLowerCase() == 'formação') {
        tipo.value = "Formação";
      }
      recursos.value = recursos
          .where((element) => element.categoria == tipo.value)
          .toList()
          .reversed
          .toList();
    }
  }
}
