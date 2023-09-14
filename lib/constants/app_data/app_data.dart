class AppData {
  final String? token;
  final String? id;
  final String? name;
  final String? photoUrl;
  final String? address;
  final String? areaId;
  final String? email;
  final String? phone;
  final String? cashback;
  final String? code;
  final String? countCodeUsed;
  final String? status;
  final String? governorateId;
  AppData({
    this.address,
    this.areaId,
    this.cashback,
    this.code,
    this.countCodeUsed,
    this.status,
    this.governorateId,
    this.token,
    this.id,
    this.name,
    this.photoUrl,
    this.email,
    this.phone,
  });

  dynamic toJson() => {
        "token": token,
        "id": id,
        "name": name,
        "photoUrl": photoUrl,
        "email": email,
        "phone": phone,
        "address": address,
        "areaId": areaId,
        "cashback": cashback,
        "code": code,
        "countCodeUsed": countCodeUsed,
        "status": status,
        "governorateId": governorateId,
      };
//update the crunnet user data
  AppData copyWith({
    String? tokenCopy,
    String? userId,
    String? nameCopy,
    String? photo,
    String? addressCopy,
    String? areaIdCopy,
    String? emailCopy,
    String? phoneCopy,
    String? cashbackCopy,
    String? codeCopy,
    String? countCodeUsedCopy,
    String? statusCopy,
    String? governorateIdCopy,
  }) {
    return AppData(
      name: nameCopy ?? name,
      token: tokenCopy ?? token,
      id: userId ?? id,
      photoUrl: photo ?? photoUrl,
      email: emailCopy ?? email,
      phone: phoneCopy ?? phone,
      address: addressCopy ?? address,
      cashback: cashbackCopy ?? cashback,
      status: statusCopy ?? status,
      governorateId: governorateIdCopy ?? governorateId,
      areaId: areaIdCopy ?? areaId,
      countCodeUsed: countCodeUsedCopy ?? countCodeUsed,
      code: codeCopy ?? code,
    );
  }

  static AppData fromJson(Map<String, dynamic> json) {
    return AppData(
      token: (json['token'] ?? ""),
      id: (json['id'] ?? ""),
      photoUrl: (json['photoUrl'] ?? ""),
      email: (json['email'] ?? ""),
      phone: (json['phone'] ?? ""),
      name: (json['name'] ?? ""),
      address: (json['address'] ?? ""),
      areaId: (json['areaId'] ?? ""),
      cashback: (json['cashback'] ?? ""),
      code: (json['code'] ?? ""),
      countCodeUsed: (json['countCodeUsed'] ?? ""),
      status: (json['status'] ?? ""),
      governorateId: (json['governorateId'] ?? ""),
    );
  }
}
