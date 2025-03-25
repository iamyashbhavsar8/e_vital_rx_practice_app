import 'package:e_vital_rx/business_logic/text_fields/text_fields_cubit.dart';
import 'package:e_vital_rx/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFields extends StatefulWidget {
  const TextFormFields({
    super.key,
    required this.textLabel,
    this.textAlign = TextAlign.start,
    this.textValidator,
    this.isError = false,
    this.controller,
    this.maxLines = 1,
    required this.onSomeChanged,
    this.textInputAction = TextInputAction.next,
    this.isHideEyeIcon = false,
    this.textInputType = TextInputType.text,
  });

  final String textLabel;
  final String? textValidator;
  final bool isError;
  final TextEditingController? controller;
  final int maxLines;
  final Function(String value)? onSomeChanged;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final bool isHideEyeIcon;
  final TextInputType textInputType;

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  bool isIconSelected = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFieldsCubit(),
      child: BlocBuilder<TextFieldsCubit, TextFieldsState>(
        builder: (context, state) {
          if (state is TextFieldsLoaded) {
            isIconSelected = state.isIconSelect;
          }
          return TextFormField(
            controller: widget.controller,
            onChanged: (value) {
              widget.onSomeChanged!(value);
            },
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            cursorColor: colorPrimary,
            style: TextStyle(color: projectBlack, fontSize: 16.sp),
            obscureText: isIconSelected ? widget.isHideEyeIcon : false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              hintText: widget.textLabel,
              filled: true,
              labelText: widget.textLabel,
              fillColor: projectWhite,
              suffixIcon: Visibility(
                visible: widget.isHideEyeIcon,
                child: IconButton(
                  onPressed: () {
                    context
                        .read<TextFieldsCubit>()
                        .isPasswordShow(isIconSelected);
                  },
                  icon: Icon(
                    isIconSelected
                        ? Icons.visibility_off
                        : Icons.remove_red_eye,
                    color: colorPrimary,
                  ),
                ),
              ),
              border: outlineBorder(isError: widget.isError),
              enabledBorder: outlineBorder(isError: widget.isError),
              disabledBorder: outlineBorder(isError: widget.isError),
              errorBorder: outlineBorder(isError: widget.isError),
              focusedErrorBorder: outlineBorder(isError: widget.isError),
              focusedBorder: outlineBorder(isError: widget.isError),
              hintStyle: TextStyle(
                color: fontGrey,
                fontSize: 16.sp,
              ),
              errorText: widget.textValidator,
              errorMaxLines: 3,
              labelStyle: TextStyle(
                color: fontGrey,
                fontSize: 16.sp,
              ),
            ),
            textInputAction: widget.textInputAction,
            textAlign: widget.textAlign,
          );
        },
      ),
    );
  }

  OutlineInputBorder outlineBorder({bool isError = false}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: isError ? Colors.red : colorPrimary,
      ),
    );
  }
}
