/// status : 201
/// message : "success"
/// data : {"user_id":"2","book_id":"2","ulasan":"pls isap dlu lae","rating":"5","updated_at":"2024-04-20T10:18:30.000000Z","created_at":"2024-04-20T10:18:30.000000Z","id":1}

class ResponseUlasan {
  ResponseUlasan({
      int? status, 
      String? message, 
      DataUlasan? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ResponseUlasan.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? DataUlasan.fromJson(json['data']) : null;
  }
  int? _status;
  String? _message;
  DataUlasan? _data;
ResponseUlasan copyWith({  int? status,
  String? message,
  DataUlasan? data,
}) => ResponseUlasan(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get status => _status;
  String? get message => _message;
  DataUlasan? get data => _data;

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
/// book_id : "2"
/// ulasan : "pls isap dlu lae"
/// rating : "5"
/// updated_at : "2024-04-20T10:18:30.000000Z"
/// created_at : "2024-04-20T10:18:30.000000Z"
/// id : 1

class DataUlasan {
  DataUlasan({
      String? userId, 
      String? bookId, 
      String? ulasan, 
      String? rating, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _userId = userId;
    _bookId = bookId;
    _ulasan = ulasan;
    _rating = rating;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  DataUlasan.fromJson(dynamic json) {
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _ulasan = json['ulasan'];
    _rating = json['rating'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _userId;
  String? _bookId;
  String? _ulasan;
  String? _rating;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
DataUlasan copyWith({  String? userId,
  String? bookId,
  String? ulasan,
  String? rating,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => DataUlasan(  userId: userId ?? _userId,
  bookId: bookId ?? _bookId,
  ulasan: ulasan ?? _ulasan,
  rating: rating ?? _rating,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get userId => _userId;
  String? get bookId => _bookId;
  String? get ulasan => _ulasan;
  String? get rating => _rating;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['ulasan'] = _ulasan;
    map['rating'] = _rating;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}