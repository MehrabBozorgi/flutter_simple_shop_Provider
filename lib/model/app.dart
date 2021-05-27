class AppModel {
  final int id;
  final String name;
  final String description;
  final String size;
  final String icon;
  final String link;

  AppModel({
    required this.id,
    required this.name,
    required this.description,
    required this.size,
    required this.icon,
    required this.link,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      id: int.parse(json['id']),
      name: json['name'],
      description: json['description'],
      size: json['size'],
      icon: json['icon'],
      link: json['link'],
    );
  }
}
