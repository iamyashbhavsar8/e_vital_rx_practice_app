part of 'login_screen_cubit.dart';

sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

class ShowUtmValueState extends LoginScreenState {
  bool isShowUtmValue;

  ShowUtmValueState(this.isShowUtmValue);
}
