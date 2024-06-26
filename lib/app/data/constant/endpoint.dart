class Endpoint {
  static const String baseUrlApi = "${Url}api/v1/user/";
  static const String Url = "http://192.168.5.50:8000/";

  static const String login = "${baseUrlApi}login";
  static const String register = "${baseUrlApi}register";
  static const String book = "${baseUrlApi}book";
  static const String ulasan = "${baseUrlApi}ulasan";
  static const String user = "${baseUrlApi}user";
  static const String search = "${baseUrlApi}books/search";
  static const String kategori = "${baseUrlApi}kategori";
  static const String koleksi = "${baseUrlApi}koleksi";
  static const String pesan = "${baseUrlApi}pesan";
  static const String pinjam = "${baseUrlApi}pinjam";
  static const String logout = "${baseUrlApi}logout";

}
