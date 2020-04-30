import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaBase with _$CategoriaController;

abstract class _CategoriaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
