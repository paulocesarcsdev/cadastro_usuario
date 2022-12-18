import 'package:cadastro_usuario/models/ads_model.dart';
import 'package:flutter/material.dart';


class AdsTile extends StatelessWidget {
  final AdsModel ads;

  const AdsTile({Key? key, required this.ads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_cart),
      title: Text(ads.titulo),
      subtitle: Text(ads.descricao),
      trailing: Text('R\$ ${ads.preco.toString()}'),
    );
  }
}
