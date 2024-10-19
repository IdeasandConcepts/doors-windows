
class Clients {

  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String profileImage;
  final double lat,lang;
  final String employeeId;
  final String clientId;

  const Clients({
    required this.clientId,
    required this.employeeId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.lang,
    required this.lat

  });
  Map<String, dynamic> toMap() {
    return {
      'client_id':clientId,
      'employee_id':employeeId,
      'latitute':lat,
      'langitute':lang,
      "name":name,
      "address":address,
      "phone_number": phoneNumber,
      "email": email,
      "profile_image": profileImage,
    };
  }

  factory Clients.fromMap(Map<String, dynamic> map) {
    return Clients(
      clientId: map['client_id'],
      employeeId: map['employee_id'],
      lang: map['langitute'],
      lat: map['latitute'],
      name: map["name"],
      address:map["address"],
      phoneNumber: map['phone_number'],
      email: map['email'],
      profileImage: map['profile_image'],

    );
  }

  Clients copyWith({
    String? clientId,
    String? employeeId,
    double? lat,
    double? lang,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? profileImage,

  }) {
    return Clients(
      clientId: clientId ?? this.clientId,
      employeeId: employeeId?? this.employeeId,
      lang: lang ?? this.lang,
      lat: lat ?? this.lat,
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      name: name ?? this.name,

    );
  }
}
