import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPreferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> salvarToken({required String token}) async {
    try {
      final prefs = await _prefs;
      return prefs.setString('token', token);
    } catch (e) {
      throw Exception('Falha ao salvar o token do usuário!: ${e.toString()}');
    }
  }

  Future<String> pegarToken() async {
    try {
      final prefs = await _prefs;
      final String? token = prefs.getString('token');
      if (token != null) {
        return token;
      } else {
        throw Exception('token não existe!');
      }
    } catch (e) {
      throw Exception('Falha ao buscar o token do usuário!: ${e.toString()}');
    }
  }

  Future<bool> apagarToken() async {
    try {
      final prefs = await _prefs;

      if (await prefs.remove('token')) {
        return true;
      } else {
        throw Exception('A chave \'token\' não existe!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao buscar o token do usuário!: ${e.toString()}');
      }
      return false;
    }
  }
}
