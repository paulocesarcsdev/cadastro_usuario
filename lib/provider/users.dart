import 'dart:math';

import 'package:cadastro_usuario/data/dummy_user.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  Map<String, User> _item = {...DUMMY_USER};

  //
  List<User> userList = [];

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  User byIndex(int i) {
    return _item.values.elementAt(i);
  }

  void put(User use) {
    if (use == null) {
      return;
    }

    // adicionar
    final id = Random().nextDouble().toString();
    var user = User(id: '100', name: 'Paulo', email: 'p@p.com.br', avatarUrl: '');

    userList.add(user);

    _item.putIfAbsent(
        id,
        () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl,
            ));

    print('===> #{_item.last}');

    // ou alterar

    notifyListeners();
  }
}
