// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$recursosAtom = Atom(name: '_HomeControllerBase.recursos');

  @override
  List<Recurso> get recursos {
    _$recursosAtom.context.enforceReadPolicy(_$recursosAtom);
    _$recursosAtom.reportObserved();
    return super.recursos;
  }

  @override
  set recursos(List<Recurso> value) {
    _$recursosAtom.context.conditionallyRunInAction(() {
      super.recursos = value;
      _$recursosAtom.reportChanged();
    }, _$recursosAtom, name: '${_$recursosAtom.name}_set');
  }

  final _$getRecursosAsyncAction = AsyncAction('getRecursos');

  @override
  Future getRecursos() {
    return _$getRecursosAsyncAction.run(() => super.getRecursos());
  }

  @override
  String toString() {
    final string = 'recursos: ${recursos.toString()}';
    return '{$string}';
  }
}
