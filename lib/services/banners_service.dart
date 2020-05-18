import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/rest_service.dart';

class BannersService {
  RestService _restService = RestService();

  Future<List<Banner>> loadBanners(int cutomerId) {
    return _restService.request<List>('GET', '/shop/$cutomerId/banners')
      .then((List value) => value.map((e) => Banner.fromJson(e)).toList());
  }
}