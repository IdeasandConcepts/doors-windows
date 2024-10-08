
class Drivers {
  String rating;
  final int phoneNumber;
  final String name;
  final String address;
  final String promoCode;
  final String email;
  // "Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other.The mouthwatering perfection starts with two 100% pure",
  final String imageSrc;

  Drivers( {
    this.rating="4.3",
    required this.phoneNumber,
    required this.name,
    required this.address,
    required this.promoCode,
    required this.email,
    required this.imageSrc,
  });
  Map<String, dynamic> toMap() {
    return {
      "rating":rating,
      "image":imageSrc,
      "phone_number": phoneNumber,
      "name": name,
      "address": address,
      "promo_code": promoCode,
      "email": email,
    };
  }
  factory Drivers.fromMap(Map<String, dynamic> map) {
    return   Drivers(
        imageSrc:map["image"],
        name: map['name'],
        address: map['address'],
        email: map['email'],
        phoneNumber: map['phone_number'],
        promoCode: map['promo_code'],
        rating: map["rating"]
    );
  }
}