part 'app_path.dart';

/// Class ini digunakan untuk menampung semua route yang ada di aplikasi
abstract class AppRoutes {
  AppRoutes._();

  static const splash = _AppPath.splash;
  static const signIn = _AppPath.signIn;
  static const signUp = _AppPath.signUp;
  static const signUpAccount = _AppPath.signUp + _AppPath.account;
  static const otp = _AppPath.otp;
  static const otpSuccess = _AppPath.otp + _AppPath.success;
  static const main = _AppPath.main;
  static const dashboard = _AppPath.main + _AppPath.dashboard;
  static const transaction = _AppPath.main + _AppPath.transaction;
  static const profile = _AppPath.main + _AppPath.profile;
  static const forgetPassword = _AppPath.forgetPassword;
  static const resetPassword = _AppPath.resetPassword;
  static const changePassword = _AppPath.changePassword;
}
