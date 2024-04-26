import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/border_style.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const AuthTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.hintText.trim().toLowerCase() == "password") {
          if (value == null || value.isEmpty) {
            return "Password is required";
          } else if (value.length < 6) {
            return "Password must not less than 6";
          } else {
            return null;
          }
        } else if (widget.hintText.trim().toLowerCase() == "email") {
          if (value == null || value.isEmpty) {
            return "Email is required ";
          } else if (!value.contains("@") || !value.contains(".")) {
            return "Input valid emails";
          } else {
            return null;
          }
        }
      },
      controller: widget.controller,
      obscureText:
          widget.hintText.trim().toLowerCase() == "password" ? _obscure : false,
      decoration: InputDecoration(
        suffixIcon: widget.hintText.trim().toLowerCase() == "password"
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: Icon(
                  _obscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        prefixIcon: widget.hintText.trim().toLowerCase() == "email"
            ? Icon(Icons.email)
            : widget.hintText.trim().toLowerCase() == "password"
                ? Icon(Icons.password_rounded)
                : widget.hintText.trim().toLowerCase() == "store"
                    ? Icon(Icons.store)
                    : widget.hintText.trim().toLowerCase() == "first name"
                        ? Icon(Icons.person)
                        : widget.hintText.trim().toLowerCase() == "last name"
                            ? Icon(Icons.person)
                            : null,
        hintText: widget.hintText,
        border: AppBorders.outlineInputBorder,
        focusedBorder: AppBorders.outlineInputBorder,
        enabledBorder: AppBorders.outlineInputBorder,
      ),
    );
  }
}
