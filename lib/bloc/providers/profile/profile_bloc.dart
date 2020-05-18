import 'package:americansoda/bloc/providers/profile/profile.dart';
import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CustomerBloc customerBloc;
  ProfileBloc({this.customerBloc});

  ProfileService profileService = ProfileService();

  @override
  ProfileState get initialState => EmptyProfileState();

  Stream<ProfileState> loadingProfileHandler() async* {
    yield LoadingProfileState();
    try {
      Profile profile = await this.profileService.loadProfile();
      customerBloc.add(InitialCustomerEvent(profile.customers));
      yield LoadingProfileSuccessState(profile);
    } catch(e) {
      yield LoadingProfileFailureState(e);
    }
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfileEvent) {
      yield* loadingProfileHandler();
    }
  }
}