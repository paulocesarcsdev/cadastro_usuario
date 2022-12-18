import 'package:cadastro_usuario/data/ads_data.dart';
import 'package:flutter/material.dart';

import '../models/ads_model.dart';

class AdsProviderController extends ChangeNotifier {
  //notifyListeners();

  AdsModel? adsList;
  final adsProvider = AdsData();
  getAds() async {
    //adsList = await adsProvider.getAds();
    notifyListeners();
  }
}
