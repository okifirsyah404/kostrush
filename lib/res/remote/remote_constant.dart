abstract class RemoteConstant {
  RemoteConstant._();

  static const baseUrl = 'https://kostrush.okifirsy.my.id';

  static const signIn = '/auth/sign-in';
  static const dashboard = '/main/dashboard';
  static const profile = '/profile';
  static const transaction = '/transaction';
  static const transactionDetail = '/transaction/{id}';
  static const search = '/dormitory/search';
  static const dormitoryBySubLocality = '/dormitory/sublocality/{location}';
  static const dormitoryDetail = '/dormitory/{id}';
}
