class UserModel {
  final int id;
  final String nome;
  final String email;

  const UserModel({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
    );
  }
}
