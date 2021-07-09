import 'package:aaaaaaaaatest/resauce/location.dart';
import 'package:aaaaaaaaatest/resauce/repository.dart';
import 'package:aaaaaaaaatest/resauce/store.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class StoreModel with ChangeNotifier {
  var isLoading = false;
  List<Store> stores = [];

  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    Position position = await _locationRepository.getCurrentLocation();

    stores = await _storeRepository.fetch(
      position.latitude,
      position.longitude,
    );
    isLoading = false;
    notifyListeners();
  }
}
