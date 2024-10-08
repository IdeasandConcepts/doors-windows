


class UserRequests {

  final String pTitle;
  final String pCode;
  final String pColor;
  final String classColor;
  final String pCategory;
  final double pHeight;
  final double pWidth;


  UserRequests(
      {
        required this.pCode,
        required this.pTitle,
        required this.pColor,
        required this.classColor,
        required this.pCategory,
        required this.pHeight,
        required this.pWidth,
      }
      );

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
  factory UserRequests.fromMap(Map<String, dynamic> map) {
    return   UserRequests(
      pCode: map["product_code"],
      pColor:map["product_color"],
      pTitle: map['product_title'],
      classColor: map['class_color'],
      pHeight: map['product_height'],
      pWidth: map['product_width'],
      pCategory: map['product_category'],
    );
  }
}

List <UserRequests>userCartRequests =[];
//dynamic  Int dayOrdersNumbers;
List <String>SelectedUserRequests =[];

void addUserCartRequests(
    {
      required String pCategory ,
      required double pWidth,
      required String classColor,
      required String pTitle,
      required String pColor,
      required String pCode,
      required double pHeight

    })
{
  final newDetails=UserRequests(
    pCode: pCode,
    pCategory: pCategory,
    pColor: pColor,
    pWidth: pWidth,
    classColor: classColor,
    pTitle: pTitle,
    pHeight: pHeight,
  );

  userCartRequests.add(newDetails);
}