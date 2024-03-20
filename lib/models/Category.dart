class Category {
  String? id, name, image;
  List<dynamic>? subs;

  Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.subs});

  factory Category.fromJson(dynamic data) {
    List<dynamic> subs = data["subs"];
    return Category(
        id: data['_id'], name: data['name'], image: data['image'], subs: subs);
  }
}
