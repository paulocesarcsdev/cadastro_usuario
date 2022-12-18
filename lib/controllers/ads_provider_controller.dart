import 'package:cadastro_usuario/data/ads_data.dart';
import 'package:flutter/material.dart';

import '../models/ads_model.dart';

class AdsProviderController extends ChangeNotifier {
  //notifyListeners();

  List<AdsModel> adsList = [];
  final adsData = AdsData();
  getAds() async {
    //adsList = await adsProvider.getAds();
    notifyListeners();
  }
}
