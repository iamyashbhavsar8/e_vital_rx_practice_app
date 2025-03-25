import 'package:bloc/bloc.dart';

part 'text_fields_state.dart';

class TextFieldsCubit extends Cubit<TextFieldsState> {
  TextFieldsCubit() : super(TextFieldsInitial());

  bool isSelectIcon = false;

  isPasswordShow(value) {
    value = !value;
    isSelectIcon = value;
    emit(TextFieldsLoaded(isSelectIcon));
  }
}
