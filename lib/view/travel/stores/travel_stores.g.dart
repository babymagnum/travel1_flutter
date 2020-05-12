// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TravelStores on _TravelStores, Store {
  final _$indexRegionAtom = Atom(name: '_TravelStores.indexRegion');

  @override
  int get indexRegion {
    _$indexRegionAtom.context.enforceReadPolicy(_$indexRegionAtom);
    _$indexRegionAtom.reportObserved();
    return super.indexRegion;
  }

  @override
  set indexRegion(int value) {
    _$indexRegionAtom.context.conditionallyRunInAction(() {
      super.indexRegion = value;
      _$indexRegionAtom.reportChanged();
    }, _$indexRegionAtom, name: '${_$indexRegionAtom.name}_set');
  }

  final _$_TravelStoresActionController =
      ActionController(name: '_TravelStores');

  @override
  dynamic setIndexRegion(int value) {
    final _$actionInfo = _$_TravelStoresActionController.startAction();
    try {
      return super.setIndexRegion(value);
    } finally {
      _$_TravelStoresActionController.endAction(_$actionInfo);
    }
  }
}
