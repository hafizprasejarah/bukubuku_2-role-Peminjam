class ResponseKategori {
  ResponseKategori({
    num? status,
    String? message,
    List<DataKategori>? data,
  }){
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseKategori.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(DataKategori.fromJson(v));
      });
    }
  }

  num? _status;
  String? _message;
  List<DataKategori>? _data;

  ResponseKategori copyWith({
    num? status,
    String? message,
    List<DataKategori>? data,
  }) => ResponseKategori(
    status: status ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  num? get status => _status;
  String? get message => _message;
  List<DataKategori>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataKategori {
  DataKategori({
    num? id,
    String? nama,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _nama = nama;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DataKategori.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _nama;
  String? _createdAt;
  String? _updatedAt;

  DataKategori copyWith({
    num? id,
    String? nama,
    String? createdAt,
    String? updatedAt,
  }) => DataKategori(
    id: id ?? _id,
    nama: nama ?? _nama,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );

  num? get id => _id;
  String? get nama => _nama;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
