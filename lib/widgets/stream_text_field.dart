import 'package:flutter/material.dart';

import 'text_form_fields.dart';

class StreamTextField extends StatelessWidget {
  const StreamTextField({
    super.key,
    required this.textLabel,
    required this.stream,
    required this.onChange,
    this.textInputAction = TextInputAction.next,
    this.isHideEyeIcon = false,
    this.textInputType = TextInputType.text,
  });

  final String textLabel;
  final Stream<Object> stream;
  final Function(String) onChange;
  final bool isHideEyeIcon;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: stream,
      builder: (context, snapshot) {
        return TextFormFields(
          textLabel: textLabel,
          onSomeChanged: (value) {
            onChange(value);
          },
          isError: snapshot.hasError,
          textValidator: snapshot.hasError ? snapshot.error!.toString() : "",
          isHideEyeIcon: isHideEyeIcon,
          textInputAction: textInputAction,
          textInputType: textInputType,
        );
      },
    );
  }
}
