import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/forget_password.dart';
import 'package:flutter_application_1/app/modules/home/sign_up.dart';
import 'package:page_transition/page_transition.dart';
import 'package:validators/validators.dart' as validators;

import 'app_colors.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPassword = false;

  final FocusNode phoneFocusNode = FocusNode();

  final FocusNode passwordFocusNode = FocusNode();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "please Enter your password";
    } else if (value.length < 8) {
      return "you hame to be the password less than 8 letters";
    } else if (!validators.isAlphanumeric(value)) {
      return "hou have to containe your  password  letters and numbers ";
    }
    return null;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  String? phone;

  String? password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(80),
          width: double.infinity,
          height: size.height,
          color: AppColors.secondaryColor,
        ),
        Positioned(
            height: size.height / 2,
            bottom: 0.4,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                decoration: const BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                width: size.width,
                height: 500,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Sign In ",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // to insert the phone number
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter your phone number';
                                  } else if (!validators.isNumeric(value)) {
                                    return 'please enter the correct of phone ';
                                  } else if (value.length < 10 ||
                                      value.length > 10) {
                                    return 'please enter the total number ';
                                  }
                                  return null;
                                },
                                onSaved: (value) => phone = value,
                                obscureText: false,
                                enabled: true,
                                controller: phoneController,
                                focusNode: phoneFocusNode,
                                cursorColor: AppColors.blackColor,
                                style: const TextStyle(
                                    color: AppColors.blackColor),
                                decoration: InputDecoration(
                                    fillColor: AppColors.greyColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.blueGrey, // لون الحدود
                                        width: 2, // سمك الحدود
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: AppColors
                                            .primaryColor, // لون الحدود عند التركيز
                                        width: 2.0,
                                      ),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: const BorderSide(
                                    //     color: Colors
                                    //         .orange, // لون الحدود عند التفعيل
                                    //     width: 2.0,
                                    //   ),
                                    // ),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: AppColors.blackColor,
                                    ),
                                    hintText: "Enter your phone number"),
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocusNode);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //to insert the password
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                enabled: true,
                                obscureText: !isPassword,
                                controller: passwordController,
                                focusNode: passwordFocusNode,
                                validator: validatePassword,
                                onSaved: (value) => password = value,
                                cursorColor: AppColors.blackColor,
                                style: const TextStyle(
                                    color: AppColors.blackColor),
                                decoration: InputDecoration(
                                    fillColor: AppColors.greyColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.blueGrey, // لون الحدود
                                        width: 2, // سمك الحدود
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: AppColors
                                            .primaryColor, // لون الحدود عند التركيز
                                        width: 2.0,
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: AppColors.blackColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },
                                    ),
                                    hintText: "Enter your password"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const ForgetPassword(),
                                          type:
                                              PageTransitionType.bottomToTop));
                                },
                                child: const Center(
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "forget Password? ",
                                        style: TextStyle(
                                            color: AppColors.primaryColor)),
                                    TextSpan(
                                        text: "Reset Here ",
                                        style: TextStyle(
                                            color: AppColors.secondaryColor)),
                                  ])),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: submit,
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: const Center(
                                    child: Text(
                                      "Sign in ",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: const SignUp(),
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "Don't already have an account?",
                                        style: TextStyle(
                                            color: AppColors.primaryColor)),
                                    TextSpan(
                                        text: "Sign up",
                                        style: TextStyle(
                                            color: AppColors.secondaryColor)),
                                  ]))),
                            ])),
                  ),
                )))
      ],
    )));
  }
}
