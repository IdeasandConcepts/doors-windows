
class Employee {
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String password;
  final String profileImage;
  final double lat,lang;
  final String employeeId;

  const Employee({
    required this.employeeId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.profileImage,
    required this.lang,
    required this.lat

  });
  Map<String, dynamic> toMap() {
    return {
      'employee_id':employeeId,
      'latitute':lat,
      'langitute':lang,
      "name":name,
      "address":address,
      "phone_number": phoneNumber,
      "email": email,
      'password':password,
      "profile_image": profileImage,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
    password:map['password'],
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

  Employee copyWith({
    String? password,
    String? employeeId,
    double? lat,
    double? lang,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? profileImage,

  }) {
    return Employee(
      employeeId: employeeId?? this.employeeId,
      lang: lang ?? this.lang,
      lat: lat ?? this.lat,
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      name: name ?? this.name,
    );
  }
}
