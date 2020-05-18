import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/services.dart';

class ProfileService {
  RestService _restService = RestService();

  Future<Profile> loadProfile() {
    return _restService.request('GET', '/profile')
      .then((value) => Profile.fromJson(value));
  }
}