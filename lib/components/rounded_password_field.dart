import 'package:flutter/material.dart';
import 'package:digisell/components/text_field_container.dart';
import 'package:digisell/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FocusNode passwordFocusNode;
  final FormFieldValidator<String> validator;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.passwordFocusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        focusNode: this.passwordFocusNode,
        onChanged: onChanged,
        validator: (value) {
          validator?.call(value);
          if(value.length<8){
            return 'password is too short.';
          }
          return null;
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
