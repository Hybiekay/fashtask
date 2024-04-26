import 'package:fashtask/backend/auth.dart';
import 'package:fashtask/constants/app_image.dart';
import 'package:fashtask/constants/app_text_style.dart';
import 'package:fashtask/global_widget/app_button.dart';
import 'package:fashtask/screens/auth/log_in/login.dart';
import 'package:fashtask/screens/auth/widget/auth_text_field.dart';
import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController storeController = TextEditingController();
  final TextEditingController fNController = TextEditingController();
  final TextEditingController lsController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formvalidate = GlobalKey<FormState>();
  bool _isloading = false;
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
                  "Welcome To FashTask",
                  style: AppTextStyle.body.copyWith(
                    fontSize: 25,
                    color: AppColor.white,
                  ),
                ),
                Text(
                  "Create New Account to use FashTask",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body.copyWith(
                    fontSize: 25,
                    color: AppColor.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formvalidate,
                    child: Column(
                      children: [
                        AuthTextField(
                          hintText: "Store ",
                          controller: storeController,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          hintText: "First Name ",
                          controller: fNController,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          hintText: "Last Name ",
                          controller: lsController,
                        ),
                        const SizedBox(height: 20),
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
                          height: 15,
                        ),
                        _isloading
                            ? CircularProgressIndicator(
                                color: AppColor.puple,
                              )
                            : AppButton(
                                buttonText: "Sign UP",
                                onPressed: () async {
                                  if (_formvalidate.currentState!.validate()) {
                                    setState(() {
                                      _isloading = true;
                                    });
                                    await UserAuth.signUp(
                                      email: emailController.text,
                                      password: passController.text,
                                      context: context,
                                    );

                                    setState(() {
                                      _isloading = false;
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
                              "Already have an account ",
                              style: AppTextStyle.body.copyWith(fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return Login();
                                }));
                              },
                              child: Text(
                                "Log In",
                                style: AppTextStyle.body.copyWith(
                                  fontSize: 18,
                                  color: AppColor.puple,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
