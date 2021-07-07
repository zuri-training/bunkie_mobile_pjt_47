import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  const CustomTextFormField({
    Key? key,
    this.hintText: '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 20,
        shadowColor: Colors.grey,
        child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText ?? '',
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
