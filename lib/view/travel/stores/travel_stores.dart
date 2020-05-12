import 'package:mobx/mobx.dart';

part 'travel_stores.g.dart';

class TravelStores = _TravelStores with _$TravelStores;

abstract class _TravelStores with Store {

  @observable
  int indexRegion = 0;

  @action
  setIndexRegion(int value) => indexRegion = value;
}