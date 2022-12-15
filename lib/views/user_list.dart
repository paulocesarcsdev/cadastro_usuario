import 'package:cadastro_usuario/components/user_title.dart';
import 'package:cadastro_usuario/data/dummy_user.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, User> users = DUMMY_USER;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserTitle(
          user: users.values.elementAt(index),
        ),
      ),
    );
  }
}
