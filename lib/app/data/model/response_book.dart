class ResponseBook {
  ResponseBook({
    this.status,
    this.message,
    this.data,
  });

  num? status;
  String? message;
  List<DataBook>? data;

  factory ResponseBook.fromJson(dynamic json) {
    return ResponseBook(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<DataBook>.from(json['data'].map((x) => DataBook.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'status': status,
      'message': message,
    };
    if (this.data != null) {
      data['data'] = this.data!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class DataBook {
  DataBook({
    this.id,
    this.kategoriId,
    this.judul,
    this.description,
    this.image,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  num? id;
  num? kategoriId;
  String? judul;
  String? description; // Added description property
  String? image;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  factory DataBook.fromJson(dynamic json) {
    return DataBook(
      id: json['id'],
      kategoriId: json['kategori_id'],
      judul: json['judul'],
      description: json['description'], // Assign description from JSON
      image: json['image'],
      penulis: json['penulis'],
      penerbit: json['penerbit'],
      tahunTerbit: json['tahun_terbit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      kategori: json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'kategori_id': kategoriId,
      'judul': judul,
      'description': description, // Include description in JSON
      'image': image,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahun_terbit': tahunTerbit,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    if (kategori != null) {
      data['kategori'] = kategori!.toJson();
    }
    return data;
  }
}

class Kategori {
  Kategori({
    this.id,
    this.nama,
  });

  num? id;
  String? nama;

  factory Kategori.fromJson(dynamic json) {
    return Kategori(
      id: json['id'],
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'nama': nama,
    };
    return data;
  }
}
