import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kostrushapp/app/views/reset_password/view/reset_password_view.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../app/views/account_sign_up/binding/account_sign_up_binding.dart';
import '../../app/views/account_sign_up/view/account_sign_up_view.dart';
import '../../app/views/forget_password/binding/forget_password_binding.dart';
import '../../app/views/forget_password/view/forget_password_view.dart';
import '../../app/views/main/binding/main_binding.dart';
import '../../app/views/main/tabs/dashboard/binding/dashboard_binding.dart';
import '../../app/views/main/tabs/dashboard/view/dashboard_view.dart';
import '../../app/views/main/tabs/profile/binding/profile_binding.dart';
import '../../app/views/main/tabs/profile/view/profile_view.dart';
import '../../app/views/main/tabs/transaction/binding/transaction_binding.dart';
import '../../app/views/main/tabs/transaction/view/transaction_view.dart';
import '../../app/views/main/view/main_view.dart';
import '../../app/views/otp/binding/otp_binding.dart';
import '../../app/views/otp/view/otp_view.dart';
import '../../app/views/reset_password/binding/reset_password_binding.dart';
import '../../app/views/sign_in/binding/sign_in_binding.dart';
import '../../app/views/sign_in/view/sign_in_view.dart';
import '../../app/views/sign_up/binding/sign_up_binding.dart';
import '../../app/views/sign_up/view/sign_up_view.dart';
import '../../app/views/splash/binding/splash_binding.dart';
import '../../app/views/splash/view/splash_view.dart';
import '../../app/views/success/binding/success_binding.dart';
import '../../app/views/success/view/success_view.dart';

/// Class ini digunakan untuk menampung semua route yang ada di aplikasi
class AppPages {
  AppPages._();

  /// Initial route
  static const String initial = AppRoutes.splash;

  /// List of routes
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpAccount,
      page: () => const AccountSignUpView(),
      binding: AccountSignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.otpSuccess,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainView(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: AppRoutes.dashboard,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: AppRoutes.transaction,
          page: () => const TransactionView(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        )
      ],
    )
  ];
}
