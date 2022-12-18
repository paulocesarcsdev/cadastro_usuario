// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cadastro_usuario/data/shared_preferences/token_preferences.dart';
import 'package:cadastro_usuario/models/ads_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AdsData {
  Dio client = Dio();
  TokenPreferences tokenPreferences = TokenPreferences();

  Future<List<AdsModel>> getAds() async {
    try {
      final String token = await tokenPreferences.pegarToken();

      final response = await client.get(
        'http://161.35.113.202/anuncios/',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        List<AdsModel> listAnuncio = [];
        for (var map in response.data) {
          listAnuncio.add(AdsModel.fromJson(map));
        }
        return listAnuncio;
      } else {
        throw Exception('Falha ao buscar os anúncios');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao buscar os anúncios: ${e.toString()}');
      }
      rethrow;
    }
  }

  Future<bool> adicionarAds({required AdsModel adsModel}) async {
    try {
      final String token = await tokenPreferences.pegarToken();

      final response = await client.post(
        'http://161.35.113.202/anuncios/',
        data: adsModel.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Falha ao adicionar anúncio');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao adicionar anúncio: ${e.toString()}');
      }
      return false;
    }
  }

  Future<bool> deletarAds({required int id}) async {
    try {
      final String token = await tokenPreferences.pegarToken();

      final response = await client.delete(
        'http://161.35.113.202/anuncios/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'},),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Falha ao deletar anúncio!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao deletar anúncio: ${e.toString()}');
      }
      return false;
    }
  }
}
