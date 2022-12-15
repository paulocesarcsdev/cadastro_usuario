import 'package:cadastro_usuario/data/dummy_user.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  Map<String, User> _item = {...DUMMY_USER};

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }
}
