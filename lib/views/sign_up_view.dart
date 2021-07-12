import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  
  @override
  _SignUpViewState createState() => _SignUpViewState();
}


class _SignUpViewState extends State<SignUpView> with WidgetsBindingObserver {
  
  AuthService _authService = AuthService();


  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  
  signUp() async {
    await _authService.signUpEmailAndPassword(
      email: _emailController.text, 
      password: _passwordController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
    ).then((value) {
      if (value != null) {
        locator<NavigationService>()
          .pushReplacementNamed(VerifyEmailViewRoute);
      } else return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 120.h,
                      child: Image.asset(
                          'assets/images/bunkie-logos/gradient-bunkie-logo.png'),
                    ),
                    CustomSpacer(flex: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Create an account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                          )),
                    ),
                    CustomSpacer(flex: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'First Name',
                            controller: _firstNameController,
                            width: 150.w,
                          ),
                        ),
                        CustomSpacer(flex: 2, horizontal: true),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'Last Name',
                            controller: _lastNameController,
                            width: 150.w
                          ),
                        ),
                        
                      ],
                    ),
                    CustomSpacer(flex: 5),
                    CustomTextFormField(
                      hintText: 'Enter Email',
                      controller: _emailController,
                    ),
                    CustomSpacer(flex: 5),
                    CustomTextFormField(
                      hintText: 'Enter Password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    CustomSpacer(flex: 10),
                    CustomButton(
                        text: 'Sign Up',
                        onPressed: () => signUp()
                      ),
                    CustomSpacer(flex: 4),
                    Text('Or register with:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        )),
                    CustomSpacer(flex: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaButton(
                            label: 'Facebook',
                            imagePath: 'assets/images/logo-facebook.png'),
                        CustomSpacer(horizontal: true, flex: 3),
                        SocialMediaButton(
                            label: 'Google',
                            imagePath: 'assets/images/logo-google.png'),
                      ],
                    ),
                    CustomSpacer(flex: 3),
                    SizedBox(height: 20),
                  ],
                )),
          ),
        ),
      );
    });
  }

  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }
}
