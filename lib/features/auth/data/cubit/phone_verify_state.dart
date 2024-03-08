abstract class PhoneVerifyState {}

class PhoneVerifyInitial extends PhoneVerifyState {}

// phone view state
class PhoneLoading extends PhoneVerifyState {}

class PhoneLSuccess extends PhoneVerifyState {}

class PhoneFailure extends PhoneVerifyState {}

// verify view state
class VerifyLoading extends PhoneVerifyState {}

class VerifyLSuccess extends PhoneVerifyState {}

class VerifyFailure extends PhoneVerifyState {}
