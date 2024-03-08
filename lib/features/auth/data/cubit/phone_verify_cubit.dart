
import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_state.dart';

class PhoneVerifyCubit extends Cubit<PhoneVerifyState> {
  PhoneVerifyCubit() : super(PhoneVerifyInitial());
}