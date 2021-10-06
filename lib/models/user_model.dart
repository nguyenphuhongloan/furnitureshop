import 'dart:convert';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String address;
  final String phone;
  final String avatar;
  final int role;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phone,
    required this.avatar,
    required this.role,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? phone,
    String? avatar,
    int? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'address': address,
      'phone': phone,
      'avatar': avatar,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      fullName: map['fullName'],
      email: map['email'],
      address: map['address'],
      phone: map['phone'],
      avatar: map['avatar'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, address: $address, phone: $phone, avatar: $avatar, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.fullName == fullName &&
      other.email == email &&
      other.address == address &&
      other.phone == phone &&
      other.avatar == avatar &&
      other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      avatar.hashCode ^
      role.hashCode;
  }
}
