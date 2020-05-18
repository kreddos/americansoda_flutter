abstract class NomenclatureEvent {}

class LoadNomenclatureEvent extends NomenclatureEvent {
  final int customerId;

  LoadNomenclatureEvent({this.customerId});
}