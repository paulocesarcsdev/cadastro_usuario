class AdsModel {
  int id;
  String title;
  String description;
  double price;
  int userId;

  AdsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.userId,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      description: json['description'],
      id: json['id'],
      price: json['price'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}
