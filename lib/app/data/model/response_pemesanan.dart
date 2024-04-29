/// status : 201
/// message : "success"
/// data : {"user_id":"2","book_id":"7","updated_at":"2024-04-28T12:16:05.000000Z","created_at":"2024-04-28T12:16:05.000000Z","id":7}

class ResponsePemesanan {
  ResponsePemesanan({
      num? status, 
      String? message, 
      DataPesan? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ResponsePemesanan.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? DataPesan.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  DataPesan? _data;
ResponsePemesanan copyWith({  num? status,
  String? message,
  DataPesan? data,
}) => ResponsePemesanan(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  DataPesan? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : "2"
/// book_id : "7"
/// updated_at : "2024-04-28T12:16:05.000000Z"
/// created_at : "2024-04-28T12:16:05.000000Z"
/// id : 7

class DataPesan {
  DataPesan({
      String? userId, 
      String? bookId, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _userId = userId;
    _bookId = bookId;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  DataPesan.fromJson(dynamic json) {
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _userId;
  String? _bookId;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
DataPesan copyWith({  String? userId,
  String? bookId,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => DataPesan(  userId: userId ?? _userId,
  bookId: bookId ?? _bookId,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get userId => _userId;
  String? get bookId => _bookId;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}