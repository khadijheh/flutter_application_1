import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/app_colors.dart';
import 'package:flutter_application_1/app/modules/home/signIn.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:validators/validators.dart' as validators;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController first_nameController = TextEditingController();
  final TextEditingController last_nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phone_numberController = TextEditingController();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode LastNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter your password";
    } else if (value.length < 8) {
      return "you hame to be the password less than 8 letters";
    } else if (!validators.isAlphanumeric(value)) {
      return "hou have to containe your  password  letters and numbers ";
    }
    return null;
  }

  String? imagePath;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? firstName;
  String? lastName;
  String? password;
  String? phoneNumber;
  bool isPasswordVisible = false;
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void submit() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
      }
    }

    return Scaffold(
        backgroundColor: AppColors.widgetBackgroundColor,
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(children: [
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: pickImage,
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(265),
                                    color: AppColors.secondaryColor,
                                    image: imagePath != null
                                        ? DecorationImage(
                                            image: FileImage(File(imagePath!)),
                                            fit: BoxFit.cover)
                                        : null,
                                  ),
                                  // child: const Positioned(
                                  //   bottom: 10,
                                  //   right: 10,
                                  //   child: Icon(Icons.camera_alt_sharp,
                                  //       size: 40, color: AppColors.greyColor),
                                  // ),
                                  child: imagePath == null
                                      ? const Icon(Icons.camera_alt_sharp,
                                          size: 40, color: AppColors.greyColor)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // textField of first name
                        TextFormField(
                          controller: first_nameController,
                          focusNode: firstNameFocusNode,
                          enabled: true,
                          onSaved: (value) => firstName = value,
                          cursorColor: AppColors.primaryColor.withOpacity(.3),
                          style: const TextStyle(color: AppColors.blackColor),
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
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.blackColor,
                              ),
                              hintText: "Enter your first name "),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(LastNameFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //textfield last name
                        TextFormField(
                          controller: last_nameController,
                          focusNode: LastNameFocusNode,
                          enabled: true,
                          onSaved: (value) => lastName = value,
                          cursorColor: AppColors.blackColor.withOpacity(.3),
                          style: const TextStyle(color: AppColors.blackColor),
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
                              prefixIcon: const Icon(Icons.person,
                                  color: AppColors.blackColor),
                              hintText: "Enter your last name "),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(phoneNumberFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //textfield of phone number
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your phone number';
                            } else if (!validators.isNumeric(value)) {
                              return 'please enter the correct of phone ';
                            } else if (value.length < 10 || value.length > 10) {
                              return 'please enter the total number ';
                            }

                            return null;
                          },
                          onSaved: (value) => phoneNumber = value,
                          obscureText: false,
                          enabled: true,
                          controller: phone_numberController,
                          cursorColor: AppColors.blackColor,
                          style: const TextStyle(color: AppColors.blackColor),
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
                                Icons.phone,
                                color: AppColors.blackColor,
                              ),
                              hintText: "Enter your phone number"),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ///   textfield of password
                        TextFormField(
                          obscureText: !isPasswordVisible,
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          validator: validatePassword,
                          onSaved: (value) => password = value,
                          cursorColor: AppColors.blackColor.withOpacity(.3),
                          style: const TextStyle(color: AppColors.blackColor),
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
                                color: AppColors.blackColor,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.blackColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              hintText: "Enter your Password"),
                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context)
                          //       .requestFocus(locaionFocusNode);
                          // },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // map to insert the location
                        SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Container(
                                width: size.width / 2,
                                color: AppColors.greyColor,
                                height: 50,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.blackColor,
                                    ),
                                    Text(
                                      "select your location",
                                      style: TextStyle(
                                          color: AppColors.secondaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.secondaryColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: () {
                              submit();
                            }),
                        SizedBox(
                          height: 7,
                        ),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "OR",
                                style: TextStyle(color: AppColors.blackColor),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 10),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: SignIn(),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: Text.rich(TextSpan(children: const [
                              TextSpan(
                                  text: "You already have an account?",
                                  style:
                                      TextStyle(color: AppColors.primaryColor)),
                              TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                      color: AppColors.secondaryColor)),
                            ]))),
                      ],
                    ),
                  ),
                )
              ]),
            )));
  }
}
