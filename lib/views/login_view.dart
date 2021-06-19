import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Container(
          height: size.height,
          width: size.width,
          child: Center(
            child: Text('Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.sp,
                )),
          ));
    });
  }
}
