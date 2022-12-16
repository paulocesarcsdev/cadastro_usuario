import 'dart:convert';
import 'package:cadastro_usuario/models/ads_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AdsProvider {
  Future<AdsModel> getAds() async {
    final url = Uri.parse('http://161.35.113.202/');
    final response = await http.get(url);
    print('===> response.body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);

      print('===> jsonDecoded: ${jsonDecoded}');

      print('===> ${AdsModel.fromJson(jsonDecoded)}');

      return AdsModel.fromJson(jsonDecoded);
    } else {
      throw Exception('Falha ao obter dados');
    }
  }
}
