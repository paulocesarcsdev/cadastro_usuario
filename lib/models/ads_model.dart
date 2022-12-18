class AdsModel {
  int id;
  String titulo;
  String descricao;
  double preco;
  int usuarioId;

  AdsModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.usuarioId,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      descricao: json['descricao'],
      id: json['id'],
      preco: json['preco'],
      titulo: json['titulo'],
      usuarioId: json['usuarioId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "descricao": descricao,
      "preco": preco,
      'usuarioId': usuarioId,
    };
  }
}
