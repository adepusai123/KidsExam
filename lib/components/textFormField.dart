import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final String labelText;

  const FormTextField({
    Key key,
    @required TextEditingController ctrlInput,
    this.onSaved,
    this.validator,
    this.labelText,
  })  : _ctrlInput = ctrlInput,
        super(key: key);

  final TextEditingController _ctrlInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      controller: _ctrlInput,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
