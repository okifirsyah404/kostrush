import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

class OtpArgument extends BaseArguments {
  final OtpPusrposeEnum context;
  final String email;

  OtpArgument({required this.context, required this.email});
}
