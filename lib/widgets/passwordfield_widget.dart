import 'package:flutter/material.dart';

class PasswordfieldWidget extends StatefulWidget {
  const PasswordfieldWidget({
    super.key,
    required this.input,
    required this.controller,
  });

  // 1. Title, Controller (obscureText, obscureToggle)
  final String input;
  final TextEditingController controller;

  @override
  State<PasswordfieldWidget> createState() => _PasswordfieldWidgetState();
}

class _PasswordfieldWidgetState extends State<PasswordfieldWidget> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(widget.input,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: "************",
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.2),
            ),
            // 2. Toggle obscureText
            suffixIcon: IconButton(
              padding: const EdgeInsets.all(0),
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: _toggleObscureText,
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 0),
          ),
        )
      ],
    );
  }
}
