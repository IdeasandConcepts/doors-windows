// ignore_for_file: public_member_api_docs, sort_constructors_first
//
// class Categories {
//   final int catId;
//   final List<Products> products;
//   final String name;
//   const Categories({
//     required this.products,
//     required this.name,
//     required this.catId
// });
//   Map<String, dynamic> toMap() {
//     return {
//       "products":products.map((e) => e.toMap()).toList(),
//       "name": name
//
//     };
//   }
//   factory Categories.fromMap(Map<String, dynamic> map) {
//     return   Categories(
//       catId: map['id'],
//       products:(map["products"]as List).map((data) => Products.fromMap(data)).toList(),
//       name: map['name'],
//
//     );
//   }
//
// }
//
// List<Categories> categoriesList=[];
// void addDataToCategories({
//   required String name,
//   required List<Products> product,
//   required int id,
// }){
//   final newDetails= Categories(
//    name: name,
//     products: product,
//     catId: id
//
//
//   );
//
//   categoriesList.add(newDetails);
// }

class Products {

  final String pTitle;
  final String pCode;
  final String pColor;
  final String classColor;
  final String pCategory;
  final double pHeight;
  final double pWidth;
  //
  // final String? id;
  // final String category;
  // final bool isFavorite;
  // final String title;
  // final double oldPrice;
  // final double price;
  // final String description;
  // // "Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other.The mouthwatering perfection starts with two 100% pure",
  // final String imageSrc;

  const Products({
    required this.pCode,
    required this.pTitle,
    required this.pColor,
    required this.classColor,
    required this.pCategory,
    required this.pHeight,
    required this.pWidth,
  });
  Map<String, dynamic> toMap() {
    return {
      "product_code":pCode,
      "product_color":pColor,
      "product_title": pTitle,
      "class_color": classColor,
      "product_category": pCategory,
      "product_height": pHeight,
      "product_width": pWidth,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      pCode: map["product_code"],
      pColor:map["product_color"],
      pTitle: map['product_title'],
      classColor: map['class_color'],
      pHeight: map['product_height'],
      pWidth: map['product_width'],
      pCategory: map['product_category'],
    );
  }

  Products copyWith({
     String? pTitle,
     String? pCode,
     String? pColor,
     String? classColor,
     String? pCategory,
     double? pHeight,
     double? pWidth,

  }) {
    return Products(
      pTitle: pTitle ?? this.pTitle,
      pCategory: pCategory ?? this.pCategory,
      pCode: pCode ?? this.pCode,
      pColor: pColor ?? this.pColor,
      classColor: classColor ?? this.classColor,
      pHeight: pHeight ?? this.pHeight,
      pWidth: pWidth ?? this.pWidth,
      //imageSrc: imageSrc ?? this.imageSrc,
    );
  }
}
