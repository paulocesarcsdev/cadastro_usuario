import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTitle extends StatelessWidget {
  final User user;

  const UserTitle({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
    );
  }
}
