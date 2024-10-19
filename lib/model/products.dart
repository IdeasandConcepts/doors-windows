

class Products {

  final String pTitle;
  final String pCode;
  final String pColor;
  final String classColor;
  final String pCategory;
  final double pHeight;
  final double pWidth;

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

List<Products> products=[];
