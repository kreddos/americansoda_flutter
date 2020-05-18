import 'package:americansoda/models/models.dart';

abstract class BannersState {}

class InitialBannersState extends BannersState {}

class LoadingBannersState extends BannersState {
  final int customerId;
  LoadingBannersState({ this.customerId });
}

class LoadingSuccessBannersState extends BannersState {
  final List<Banner> data;
  LoadingSuccessBannersState(this.data);
}

class LoadingFailureBannersState extends BannersState {
  final dynamic error;
  LoadingFailureBannersState(this.error);
}