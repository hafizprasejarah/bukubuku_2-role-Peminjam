import 'package:get/get.dart';

import '../modules/book_detail/bindings/book_detail_binding.dart';
import '../modules/book_detail/views/book_detail_view.dart';
import '../modules/book_list/bindings/book_list_binding.dart';
import '../modules/book_list/views/book_list_view.dart';
import '../modules/denda/bindings/denda_binding.dart';
import '../modules/denda/views/denda_view.dart';
import '../modules/dipinjam/bindings/dipinjam_binding.dart';
import '../modules/dipinjam/views/dipinjam_view.dart';
import '../modules/emailadmin/bindings/emailadmin_binding.dart';
import '../modules/emailadmin/views/emailadmin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/koleksi/bindings/koleksi_binding.dart';
import '../modules/koleksi/views/koleksi_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/searchtap/bindings/searchtap_binding.dart';
import '../modules/searchtap/views/searchtap_view.dart';
import '../modules/ulasan/bindings/ulasan_binding.dart';
import '../modules/ulasan/views/ulasan_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAIL,
      page: () => const BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_LIST,
      page: () => const BookListView(),
      binding: BookListBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.KOLEKSI,
      page: () => KoleksiView(),
      binding: KoleksiBinding(),
    ),
    GetPage(
      name: _Paths.ULASAN,
      page: () => const UlasanView(),
      binding: UlasanBinding(),
    ),
    GetPage(
      name: _Paths.DENDA,
      page: () => const DendaView(),
      binding: DendaBinding(),
    ),
    GetPage(
      name: _Paths.DIPINJAM,
      page: () => const DipinjamView(),
      binding: DipinjamBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHTAP,
      page: () => const SearchtapView(),
      binding: SearchtapBinding(),
    ),
    GetPage(
      name: _Paths.EMAILADMIN,
      page: () => const EmailadminView(),
      binding: EmailadminBinding(),
    ),

  ];
}
