// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaController on _CategoriaBase, Store {
  final _$recursosAtom = Atom(name: '_CategoriaBase.recursos');

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

  final _$tipoAtom = Atom(name: '_CategoriaBase.tipo');

  @override
  String get tipo {
    _$tipoAtom.context.enforceReadPolicy(_$tipoAtom);
    _$tipoAtom.reportObserved();
    return super.tipo;
  }

  @override
  set tipo(String value) {
    _$tipoAtom.context.conditionallyRunInAction(() {
      super.tipo = value;
      _$tipoAtom.reportChanged();
    }, _$tipoAtom, name: '${_$tipoAtom.name}_set');
  }

  final _$filtrarAsyncAction = AsyncAction('filtrar');

  @override
  Future filtrar() {
    return _$filtrarAsyncAction.run(() => super.filtrar());
  }

  @override
  String toString() {
    final string = 'recursos: ${recursos.toString()},tipo: ${tipo.toString()}';
    return '{$string}';
  }
}
