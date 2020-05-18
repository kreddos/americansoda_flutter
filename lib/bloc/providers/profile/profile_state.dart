import 'package:americansoda/models/models.dart';

abstract class ProfileState {}

class EmptyProfileState implements ProfileState {}

class LoadingProfileState implements ProfileState {}

class LoadingProfileSuccessState implements ProfileState {
  final Profile data;
  LoadingProfileSuccessState(this.data);
}

class LoadingProfileFailureState implements ProfileState {
  final dynamic error;
  LoadingProfileFailureState(this.error);
}





