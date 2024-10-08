
class Clients {

  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String profileImage;

  const Clients({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,

  });
  Map<String, dynamic> toMap() {
    return {
      "name":name,
      "address":address,
      "phone_number": phoneNumber,
      "email": email,
      "profile_image": profileImage,
    };
  }

  factory Clients.fromMap(Map<String, dynamic> map) {
    return Clients(
      name: map["name"],
      address:map["address"],
      phoneNumber: map['phone_number'],
      email: map['email'],
      profileImage: map['profile_image'],

    );
  }

  Clients copyWith({
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? profileImage,

  }) {
    return Clients(
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      name: name ?? this.name,

    );
  }
}
