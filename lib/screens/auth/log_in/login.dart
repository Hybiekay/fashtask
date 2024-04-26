import 'package:fashtask/backend/auth.dart';
import 'package:fashtask/constants/app_image.dart';
import 'package:fashtask/constants/app_text_style.dart';
import 'package:fashtask/global_widget/app_button.dart';
import 'package:fashtask/screens/auth/sign_up/sign_up.dart';
import 'package:fashtask/screens/auth/widget/auth_text_field.dart';
import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formvalidate = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.onboardingImage3),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back ",
                  style: AppTextStyle.body.copyWith(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Login To Continue  ",
                  style: AppTextStyle.body.copyWith(
                    fontSize: 25,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formvalidate,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AuthTextField(
                            hintText: "Email ",
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),
                          AuthTextField(
                            hintText: "Password",
                            controller: passController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          _isLoading
                              ? CircularProgressIndicator(
                                  color: AppColor.puple,
                                )
                              : AppButton(
                                  buttonText: "Login",
                                  onPressed: () async {
                                    if (_formvalidate.currentState!
                                        .validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      // await UserAuth.login(
                                      //     email: emailController.text,
                                      //     password: passController.text,
                                      //     context: context);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account  ",
                                style: AppTextStyle.body.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignUP()),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: AppTextStyle.body.copyWith(
                                        fontSize: 18,
                                        color: AppColor.puple,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
