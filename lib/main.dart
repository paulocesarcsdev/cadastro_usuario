import 'package:cadastro_usuario/controllers/ads_provider_controller.dart';
import 'package:cadastro_usuario/data/shared_preferences/token_preferences.dart';
import 'package:cadastro_usuario/views/pages/ads_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/user_provider_controller.dart';
import 'views/pages/home_page.dart';
import 'views/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TokenPreferences tokenPreferences = TokenPreferences();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdsProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: tokenPreferences.pegarToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data == null) {
                return HomePage();
              } else {
                return AdsPage();
              }
            }
          },
        ),
      ),
    );
  }
}
