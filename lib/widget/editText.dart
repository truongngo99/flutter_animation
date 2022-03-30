import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final bool suffixIcon;
  const EditText(
      {Key? key,
      required this.hintText,
      this.textInputAction,
      required this.suffixIcon,
      required this.textEditingController})
      : super(key: key);

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.suffixIcon
          ? _isObs
              ? true
              : false
          : false,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon
              ? InkWell(
                  child: Icon(_isObs ? Icons.visibility : Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      _isObs = !_isObs;
                    });
                  },
                )
              : null),
      textInputAction: widget.textInputAction,
    );
  }
}
