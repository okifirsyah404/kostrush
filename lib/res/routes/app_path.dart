part of 'app_routes.dart';

// Class ini digunakan untuk menampung semua route yang ada di aplikasi
abstract class _AppPath {
  _AppPath._();

  static const splash = '/splash';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const otp = '/otp';
  static const account = '/account';
  static const success = '/success';
  static const forgetPassword = '/forget-password';
  static const resetPassword = '/reset-password';
  static const changePassword = '/change-password';
  static const main = '/main';
  static const dashboard = '/dashboard';
  static const transaction = '/transaction';
  static const profile = '/profile';
}
