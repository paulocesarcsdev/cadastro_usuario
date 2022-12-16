import 'package:cadastro_usuario/provider/ads_provider.dart';
import 'package:flutter/material.dart';

import '../../models/ads_model.dart';

class AdsViewController extends ChangeNotifier {
  AdsModel? adsList;
  final adsProvider = AdsProvider();
  getAds() async  {
    adsList = await adsProvider.getAds();
  }
}
