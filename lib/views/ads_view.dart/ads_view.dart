import 'package:cadastro_usuario/views/ads_view.dart/ads_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AdsView extends StatefulWidget {
  const AdsView({Key? key}) : super(key: key);

  @override
  State<AdsView> createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Provider.of<AdsViewController>(context, listen: false).getAds();
        },
        child: Text('Buscar anúncios'),
      ),
    );
  }
}
