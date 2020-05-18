import 'package:americansoda/bloc/providers/banners/banners.dart';
import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/banners_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  final BannersService bannersService = BannersService();

  @override
  BannersState get initialState => InitialBannersState();

  Stream<BannersState> onLoadBanners(LoadBannersEvent event) async* {
    yield LoadingBannersState();

    try {
      List<Banner> banners = await bannersService.loadBanners(event.customerId);

      yield LoadingSuccessBannersState(banners);
    } catch (e) {
      yield LoadingFailureBannersState(e);
    }
  }

  @override
  Stream<BannersState> mapEventToState(BannersEvent event) async* {
    if (event is LoadBannersEvent) {
      yield* onLoadBanners(event);
    }
  }
}