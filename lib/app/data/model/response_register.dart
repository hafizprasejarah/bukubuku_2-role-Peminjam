class ResponseRegister {
  ResponseRegister({
    num? status,
    String? message,
    DataRegister? data,
  }){
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseRegister.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? DataRegister.fromJson(json['data']) : null;
  }

  num? _status;
  String? _message;
  DataRegister? _data;

  num? get status => _status;
  String? get message => _message;
  DataRegister? get data => _data;
}

class DataRegister {
  DataRegister({
    String? nama,
    String? username,
    String? email,
    String? telp,
    String? alamat,
    String? role,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _nama = nama;
    _username = username;
    _email = email;
    _telp = telp;
    _alamat = alamat;
    _role = role;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  DataRegister.fromJson(dynamic json) {
    _nama = json['nama'];
    _username = json['username'];
    _email = json['email'];
    _telp = json['telp'];
    _alamat = json['alamat'];
    _role = json['role'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _nama;
  String? _username;
  String? _email;
  String? _telp;
  String? _alamat;
  String? _role;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  String? get nama => _nama;
  String? get username => _username;
  String? get email => _email;
  String? get telp => _telp;
  String? get alamat => _alamat;
  String? get role => _role;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;
}
