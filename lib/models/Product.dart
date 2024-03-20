class Product {
  int count = 1;

  List<dynamic>? images, features, imgcolors, colors;
  int? discount, price;
  String? id,
      name,
      brand,
      category,
      subcat,
      childcat,
      tag,
      desc,
      detail,
      delivery,
      warranty,
      size;
  bool? stutus;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.subcat,
    required this.childcat,
    required this.tag,
    required this.desc,
    required this.detail,
    required this.delivery,
    required this.warranty,
    required this.size,
    required this.stutus,
    required this.discount,
    required this.price,
    required this.images,
    required this.features,
    required this.imgcolors,
    required this.colors,
  });

  factory Product.fromJson(dynamic data) {
    List<dynamic> images = data["images"] as List;
    List<dynamic> features = data["features"] as List;
    List<dynamic> imgcolors = data["imgcolors"] as List;
    List<dynamic> colors = data["colors"] as List;
    return Product(
        id: data['_id'],
        name: data['name'],
        brand: data['brand'],
        category: data['category'],
        subcat: data['subcat'],
        childcat: data['childcat'],
        tag: data['tag'],
        desc: data['desc'],
        detail: data['detail'],
        delivery: data['delivery'],
        warranty: data['warranty'],
        size: data['size'],
        stutus: data['stutus'],
        discount: data['discount'],
        price: data['price'],
        colors: colors,
        imgcolors: imgcolors,
        features: features,
        images: images);
  }
}
