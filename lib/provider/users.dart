import 'package:cadastro_usuario/data/dummy_user.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _item = {...DUMMY_USER};

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  //Ainda tenho erro no user_list.dart
  //estou adicionanmdo isso para ver se la volta a funcionar
  User byIndex(int i) {
    return _item.values.elementAt(i);
  }
}
