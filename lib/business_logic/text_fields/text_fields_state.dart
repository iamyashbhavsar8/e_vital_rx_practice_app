part of 'text_fields_cubit.dart';

abstract class TextFieldsState {}

class TextFieldsInitial extends TextFieldsState {}

class TextFieldsLoaded extends TextFieldsState {
  final bool isIconSelect;
  TextFieldsLoaded(this.isIconSelect);
}
