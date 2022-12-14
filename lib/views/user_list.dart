import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget{
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários')
        ),

    );
  }
}