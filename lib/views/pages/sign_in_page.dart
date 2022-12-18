// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cadastro_usuario/data/user_data.dart';
import 'package:cadastro_usuario/models/user_model.dart';
import 'package:cadastro_usuario/views/pages/ads_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserData userData = UserData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cadastre aqui"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Insira seus dados"),
                SizedBox(
                  height: 102,
                ),
                Text("Nome"),
                TextField(
                  controller: nomeController,
                ),
                SizedBox(
                  height: 36,
                ),
                Text("Email"),
                TextField(
                  controller: emailController,
                ),
                SizedBox(
                  height: 36,
                ),
                Text("Senha"),
                TextField(
                  controller: senhaController,
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final bool result = await userData.cadastrarUsuario(
                      nome: nomeController.text,
                      email: emailController.text,
                      senha: senhaController.text,
                    );
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Entrando..."),
                        ),
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdsPage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Falha ao realizar o cadastro... Tente novamente!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: Text("Cadastrar"),
                ),
                SizedBox(
                  height: 18,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ja possuo uma conta"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
