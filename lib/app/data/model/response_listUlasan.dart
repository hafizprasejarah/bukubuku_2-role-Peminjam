/// status : 200
/// message : "success"
/// data : [{"id":1,"user_id":2,"book_id":2,"ulasan":"pls isap dlu lae","rating":5,"created_at":"2024-04-20T10:18:30.000000Z","updated_at":"2024-04-20T10:18:30.000000Z","user":{"id":2,"username":"hafiz23","email":"hafizpratama0809@gmail.com","image":"images/1712858626.png","nama":"hafiz pratama","telp":"0890820","alamat":"jawa tengah","role":"PEMINJAM","created_at":"2024-03-05T01:36:14.000000Z","updated_at":"2024-04-18T13:44:02.000000Z"},"book":{"id":2,"kategori_id":1,"judul":"ddsadasdsa","image":"post_images/1709366997.jpg","description":"Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat","penulis":" hafiz","penerbit":"cvcvc","tahun_terbit":2023,"created_at":"2024-03-02T08:31:51.000000Z","updated_at":"2024-03-06T13:33:17.000000Z"}},{"id":2,"user_id":2,"book_id":2,"ulasan":"pls isap dlu lae","rating":5,"created_at":"2024-04-21T13:06:56.000000Z","updated_at":"2024-04-21T13:06:56.000000Z","user":{"id":2,"username":"hafiz23","email":"hafizpratama0809@gmail.com","image":"images/1712858626.png","nama":"hafiz pratama","telp":"0890820","alamat":"jawa tengah","role":"PEMINJAM","created_at":"2024-03-05T01:36:14.000000Z","updated_at":"2024-04-18T13:44:02.000000Z"},"book":{"id":2,"kategori_id":1,"judul":"ddsadasdsa","image":"post_images/1709366997.jpg","description":"Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat","penulis":" hafiz","penerbit":"cvcvc","tahun_terbit":2023,"created_at":"2024-03-02T08:31:51.000000Z","updated_at":"2024-03-06T13:33:17.000000Z"}},{"id":3,"user_id":2,"book_id":5,"ulasan":"dasdas","rating":5,"created_at":"2024-04-21T14:06:47.000000Z","updated_at":"2024-04-21T14:06:47.000000Z","user":{"id":2,"username":"hafiz23","email":"hafizpratama0809@gmail.com","image":"images/1712858626.png","nama":"hafiz pratama","telp":"0890820","alamat":"jawa tengah","role":"PEMINJAM","created_at":"2024-03-05T01:36:14.000000Z","updated_at":"2024-04-18T13:44:02.000000Z"},"book":{"id":5,"kategori_id":1,"judul":"Moby Dick","image":"post_images/1713541911.png","description":"Karya ini bercerita tentang petualangan sang tokoh (bernama Ishmael) dalam mengikuti pelayaran kapal pemburu paus yang dipimpin oleh seorang kapten obsesif bernama Kapten Ahab. Sang kapten hanya memiliki satu kaki akibat kecelakaan di kala memburu seekor paus yang dijulukinya Moby-Dick. Ia sangat bernafsu melampiaskan dendamnya kepada sang hewan hingga tidak peduli akan keselamatan diri maupun anak buahnya. Cerita berakhir dengan tragedi.","penulis":"\tHerman Melville","penerbit":"\tRichard Bentley & Harper & Brothers","tahun_terbit":1851,"created_at":"2024-03-03T13:41:24.000000Z","updated_at":"2024-04-19T15:53:56.000000Z"}}]

class ResponseListUlasan {
  ResponseListUlasan({
      num? status, 
      String? message, 
      List<DataUlasanList>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ResponseListUlasan.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataUlasanList.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<DataUlasanList>? _data;
ResponseListUlasan copyWith({  num? status,
  String? message,
  List<DataUlasanList>? data,
}) => ResponseListUlasan(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  List<DataUlasanList>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// user_id : 2
/// book_id : 2
/// ulasan : "pls isap dlu lae"
/// rating : 5
/// created_at : "2024-04-20T10:18:30.000000Z"
/// updated_at : "2024-04-20T10:18:30.000000Z"
/// user : {"id":2,"username":"hafiz23","email":"hafizpratama0809@gmail.com","image":"images/1712858626.png","nama":"hafiz pratama","telp":"0890820","alamat":"jawa tengah","role":"PEMINJAM","created_at":"2024-03-05T01:36:14.000000Z","updated_at":"2024-04-18T13:44:02.000000Z"}
/// book : {"id":2,"kategori_id":1,"judul":"ddsadasdsa","image":"post_images/1709366997.jpg","description":"Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat","penulis":" hafiz","penerbit":"cvcvc","tahun_terbit":2023,"created_at":"2024-03-02T08:31:51.000000Z","updated_at":"2024-03-06T13:33:17.000000Z"}

class DataUlasanList {
  DataUlasanList({
      num? id, 
      num? userId, 
      num? bookId, 
      String? ulasan, 
      num? rating, 
      String? createdAt, 
      String? updatedAt, 
      User? user, 
      Book? book,}){
    _id = id;
    _userId = userId;
    _bookId = bookId;
    _ulasan = ulasan;
    _rating = rating;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _book = book;
}

  DataUlasanList.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _ulasan = json['ulasan'];
    _rating = json['rating'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  num? _id;
  num? _userId;
  num? _bookId;
  String? _ulasan;
  num? _rating;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
  Book? _book;
DataUlasanList copyWith({  num? id,
  num? userId,
  num? bookId,
  String? ulasan,
  num? rating,
  String? createdAt,
  String? updatedAt,
  User? user,
  Book? book,
}) => DataUlasanList(  id: id ?? _id,
  userId: userId ?? _userId,
  bookId: bookId ?? _bookId,
  ulasan: ulasan ?? _ulasan,
  rating: rating ?? _rating,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  book: book ?? _book,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get bookId => _bookId;
  String? get ulasan => _ulasan;
  num? get rating => _rating;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['ulasan'] = _ulasan;
    map['rating'] = _rating;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_book != null) {
      map['book'] = _book?.toJson();
    }
    return map;
  }

}

/// id : 2
/// kategori_id : 1
/// judul : "ddsadasdsa"
/// image : "post_images/1709366997.jpg"
/// description : "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat"
/// penulis : " hafiz"
/// penerbit : "cvcvc"
/// tahun_terbit : 2023
/// created_at : "2024-03-02T08:31:51.000000Z"
/// updated_at : "2024-03-06T13:33:17.000000Z"

class Book {
  Book({
      num? id, 
      num? kategoriId, 
      String? judul, 
      String? image, 
      String? description, 
      String? penulis, 
      String? penerbit, 
      num? tahunTerbit, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _kategoriId = kategoriId;
    _judul = judul;
    _image = image;
    _description = description;
    _penulis = penulis;
    _penerbit = penerbit;
    _tahunTerbit = tahunTerbit;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Book.fromJson(dynamic json) {
    _id = json['id'];
    _kategoriId = json['kategori_id'];
    _judul = json['judul'];
    _image = json['image'];
    _description = json['description'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _tahunTerbit = json['tahun_terbit'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _kategoriId;
  String? _judul;
  String? _image;
  String? _description;
  String? _penulis;
  String? _penerbit;
  num? _tahunTerbit;
  String? _createdAt;
  String? _updatedAt;
Book copyWith({  num? id,
  num? kategoriId,
  String? judul,
  String? image,
  String? description,
  String? penulis,
  String? penerbit,
  num? tahunTerbit,
  String? createdAt,
  String? updatedAt,
}) => Book(  id: id ?? _id,
  kategoriId: kategoriId ?? _kategoriId,
  judul: judul ?? _judul,
  image: image ?? _image,
  description: description ?? _description,
  penulis: penulis ?? _penulis,
  penerbit: penerbit ?? _penerbit,
  tahunTerbit: tahunTerbit ?? _tahunTerbit,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get kategoriId => _kategoriId;
  String? get judul => _judul;
  String? get image => _image;
  String? get description => _description;
  String? get penulis => _penulis;
  String? get penerbit => _penerbit;
  num? get tahunTerbit => _tahunTerbit;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['kategori_id'] = _kategoriId;
    map['judul'] = _judul;
    map['image'] = _image;
    map['description'] = _description;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['tahun_terbit'] = _tahunTerbit;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 2
/// username : "hafiz23"
/// email : "hafizpratama0809@gmail.com"
/// image : "images/1712858626.png"
/// nama : "hafiz pratama"
/// telp : "0890820"
/// alamat : "jawa tengah"
/// role : "PEMINJAM"
/// created_at : "2024-03-05T01:36:14.000000Z"
/// updated_at : "2024-04-18T13:44:02.000000Z"

class User {
  User({
      num? id, 
      String? username, 
      String? email, 
      String? image, 
      String? nama, 
      String? telp, 
      String? alamat, 
      String? role, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _username = username;
    _email = email;
    _image = image;
    _nama = nama;
    _telp = telp;
    _alamat = alamat;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _image = json['image'];
    _nama = json['nama'];
    _telp = json['telp'];
    _alamat = json['alamat'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _username;
  String? _email;
  String? _image;
  String? _nama;
  String? _telp;
  String? _alamat;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? username,
  String? email,
  String? image,
  String? nama,
  String? telp,
  String? alamat,
  String? role,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  image: image ?? _image,
  nama: nama ?? _nama,
  telp: telp ?? _telp,
  alamat: alamat ?? _alamat,
  role: role ?? _role,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get image => _image;
  String? get nama => _nama;
  String? get telp => _telp;
  String? get alamat => _alamat;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['image'] = _image;
    map['nama'] = _nama;
    map['telp'] = _telp;
    map['alamat'] = _alamat;
    map['role'] = _role;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}