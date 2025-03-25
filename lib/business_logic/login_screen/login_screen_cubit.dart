import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/constants.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());

  final userNameController = BehaviorSubject<String>();

  Stream<String> get userNameStream => userNameController.stream;

  void userNameValidate(String userName) {
    if (userName.isEmpty) {
      userNameController.sink.addError('emptyField'.tr());
    } else if (userName.length < 3) {
      userNameController.sink.addError('contactValidation'.tr());
    } else {
      userNameController.sink.add(userName);
    }
  }

  final contactController = BehaviorSubject<String>();

  Stream<String> get contactStream => contactController.stream;

  // Validation of contact
  void contactValidate(String contact) {
    final bool contactValid = phoneRegex.hasMatch(contact);
    if (contactValid) {
      contactController.sink.add(contact);
    } else if (contact.isEmpty) {
      contactController.sink.addError('emptyField'.tr());
    } else {
      contactController.sink.addError('contactValidation'.tr());
    }
  }

  final passwordController = BehaviorSubject<String>();

  Stream<String> get passwordStream => passwordController.stream;

  // Validation of password
  void passwordValidate(String password) {
    final bool contactValid = passwordRegex.hasMatch(password);
    if (contactValid) {
      passwordController.sink.add(password);
    } else if (password.isEmpty) {
      passwordController.sink.addError('emptyField'.tr());
    } else {
      passwordController.sink.addError('passwordValidation'.tr());
    }
  }

  Stream<bool> get validateSignUpForm => Rx.combineLatest3(
        userNameStream,
        contactStream,
        passwordStream,
        (name, number, password) => true,
      );

  updateShowUtmValue({required bool isShowUtmValue}) {
    isShowUtmValue = !isShowUtmValue;
    emit(ShowUtmValueState(isShowUtmValue));
  }
}
