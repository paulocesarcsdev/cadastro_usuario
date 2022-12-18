import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text('Prova final - Paulo César')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Esse app é sobre anúncios",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 56,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: const Text("Continuar")),
          ],
        ),
      ),
    );
  }
}
