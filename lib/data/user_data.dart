import 'dart:convert';

import 'package:cadastro_usuario/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'shared_preferences/token_preferences.dart';

class UserData {
  Dio client = Dio();
  TokenPreferences tokenPreferences = TokenPreferences();

  Future<bool> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      final Map<String, dynamic> parameters = {
        'nome': nome,
        'email': email,
        'senha': senha,
      };

      final response =
          await client.post('http://161.35.113.202/usuario/', data: parameters);
      if (response.statusCode == 201) {
        await loginUsuario(email: email, senha: senha);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao cadastrar novo usuário!: ${e.toString()}');
      }
      return false;
    }
  }

  Future<bool> loginUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      final Map<String, dynamic> parameters = {
        'email': email,
        'senha': senha,
      };

      final response =
          await client.post('http://161.35.113.202/login/', data: parameters);
      if (response.statusCode == 200) {
        final String token = response.data['token'];
        tokenPreferences.salvarToken(token: token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao realizar o login do usuário!: ${e.toString()}');
      }
      return false;
    }
  }

  Future<bool> logoutUsuario() async {
    try {
      final String token = await tokenPreferences.pegarToken();
      final response = await client.post(
        'http://161.35.113.202/logout/',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        await tokenPreferences.apagarToken();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao realizar o logout do usuário!: ${e.toString()}');
      }
      return false;
    }
  }

  Future<UserModel?> getUsuario() async {
    try {
      final String token = await tokenPreferences.pegarToken();
      final response = await client.get(
        'http://161.35.113.202/usuario/',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(Map.from(response.data));
        return user;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Falha ao buscar os dados do usuário!: ${e.toString()}');
      }
      return null;
    }
  }
}
