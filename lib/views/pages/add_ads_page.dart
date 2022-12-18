// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:math';

import 'package:cadastro_usuario/data/ads_data.dart';
import 'package:cadastro_usuario/data/user_data.dart';
import 'package:cadastro_usuario/models/ads_model.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class AddAdsPage extends StatelessWidget {
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final precoController = TextEditingController();
  AddAdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adsData = AdsData();
    final userData = UserData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Adicione seu anúncio aqui"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Insira os dados do novo anúncio"),
                SizedBox(
                  height: 102,
                ),
                Text("Titulo"),
                TextField(
                  controller: tituloController,
                ),
                SizedBox(
                  height: 36,
                ),
                Text("Descrição"),
                TextField(
                  controller: descricaoController,
                ),
                SizedBox(
                  height: 36,
                ),
                Text("Preço"),
                TextField(
                  controller: precoController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final UserModel? user = await userData.getUsuario();
                    if (user != null) {
                      final ads = AdsModel(
                        id: Random.secure().nextInt(1000),
                        titulo: tituloController.text,
                        descricao: descricaoController.text,
                        preco: double.parse(precoController.text),
                        usuarioId: user.id,
                      );
                      final bool result =
                          await adsData.adicionarAds(adsModel: ads);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Anuncio adicionado com sucesso!"),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Falha ao adicionar este anúncio... Tente novamente!"),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Falha ao adicionar este anúncio... Tente novamente!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: Text("Adicionar"),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
