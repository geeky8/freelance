class DetailModel {
  DetailModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  factory DetailModel.fromJson({required Map<String, dynamic> json}) {
    return DetailModel(
      id: json['catid'],
      name: json['category_name'],
      imgUrl: json['imagedata'],
    );
  }

  final int id;
  final String name;
  final String imgUrl;
}
