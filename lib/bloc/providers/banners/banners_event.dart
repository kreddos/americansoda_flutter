import 'package:equatable/equatable.dart';

abstract class BannersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBannersEvent extends BannersEvent {
  final int customerId;
  LoadBannersEvent({ this.customerId });
}
