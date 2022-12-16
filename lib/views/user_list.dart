import 'package:cadastro_usuario/components/user_title.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                users.put(User(
                    name: 'Teste',
                    email: 'aluno@aluno.com',
                    avatarUrl: '',
                    id: ''));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<Users>(context, listen: false).userList.length,
        //itemCount: users.count,
        itemBuilder: (context, i) {
          return UserTitle(
            user: Provider.of<Users>(context, listen: false).userList[i],
          );
        },
      ),
    );
  }
}
