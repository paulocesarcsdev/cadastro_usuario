import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/views/ads_view.dart/ads_view_controller.dart';
import 'package:cadastro_usuario/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cadastro_usuario/views/ads_view.dart/ads_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
        ChangeNotifierProvider(create: (context) => AdsViewController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AdsView(),
        //home: const UserList(),
      ),
    );
  }
}
