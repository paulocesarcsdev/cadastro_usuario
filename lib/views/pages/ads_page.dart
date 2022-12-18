// ignore_for_file: prefer_const_constructors

import 'package:cadastro_usuario/data/user_data.dart';
import 'package:cadastro_usuario/models/ads_model.dart';
import 'package:flutter/material.dart';

import '../../data/ads_data.dart';
import '../components/ads_tile.dart';
import 'add_ads_page.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  AdsData adsData = AdsData();
  UserData userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Anuncios'),
        leading: IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.red,
          ),
          onPressed: () async {
            if (await userData.logoutUsuario()) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: FutureBuilder(
          future: adsData.getAds(), //função de pegar os anuncios
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<AdsModel> listAnuncio = snapshot.data as List<AdsModel>;
              return listAnuncio.isEmpty
                  ? Center(
                      child: Text("Esta lista de anúncios está vazia!.."),
                    )
                  : ListView.builder(
                      itemCount:
                          listAnuncio.length, // lenght da lista de anuncio
                      itemBuilder: (context, index) {
                        return InkWell(
                          onLongPress: () async {
                            if (await adsData.deletarAds(
                                id: listAnuncio[index].id)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Anúncio deletado com sucesso!"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Falha ao deletar o anúncio... Tente novamente!"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: AdsTile(ads: listAnuncio[index]),
                        );
                      }, //Anuncio Tile
                    );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAdsPage(),
              ),
            );
          }),
    );
  }
}
