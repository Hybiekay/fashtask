import 'package:flutter/material.dart';

import '../../../core/border_style.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  const AuthTextField({
    super.key,
    required this.hintText,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
                : null,
        hintText: widget.hintText,
        border: AppBorders.outlineInputBorder,
        focusedBorder: AppBorders.outlineInputBorder,
        enabledBorder: AppBorders.outlineInputBorder,
      ),
    );
  }
}
