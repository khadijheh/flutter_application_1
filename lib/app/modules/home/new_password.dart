import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:validators/validators.dart' as validators;

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfipasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isPassword = false;
  bool isConfirmPasswordVisible = false;
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
        height: size.height,
        color: AppColors.secondaryColor,
        child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(256),
              color: AppColors.secondaryColor),
          child: const Text(
            "** Creatig  Pasword",
            style: TextStyle(
                fontSize: 25,
                color: AppColors.widgetBackgroundColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned(
          height: size.height / 2,
          bottom: 0.4,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              decoration: const BoxDecoration(
                  color: AppColors.widgetBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              width: size.width,
              height: 500,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                  child: SingleChildScrollView(
                      child: Form(
                          key: formKey,
                          child: Column(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "A new password",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondaryColor),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                // to insert the phone number
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.onUnfocus,
                                  enabled: true,
                                  obscureText: !isPassword,
                                  controller: passwordController,
                                  validator: validatePassword,
                                  onSaved: (value) => password = value,
                                  cursorColor: AppColors.blackColor,
                                  style: const TextStyle(
                                      color: AppColors.blackColor),
                                  decoration: InputDecoration(
                                      fillColor: AppColors.greyColor,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey, // لون الحدود
                                          width: 2, // سمك الحدود
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                        icon: Icon(isPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            isPassword = !isPassword;
                                          });
                                        },
                                      ),
                                      hintText: "Enter a new  password"),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                // confirm the new password
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.onUnfocus,
                                  enabled: true,
                                  obscureText: !isConfirmPasswordVisible,
                                  controller: ConfipasswordController,
                                  validator: validateConfirmPassword,
                                  // onSaved: (value) => password = value,
                                  cursorColor: AppColors.blackColor,
                                  style: const TextStyle(
                                      color: AppColors.blackColor),
                                  decoration: InputDecoration(
                                      fillColor: AppColors.greyColor,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey, // لون الحدود
                                          width: 2, // سمك الحدود
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            isConfirmPasswordVisible =
                                                !isConfirmPasswordVisible;
                                          });
                                        },
                                      ),
                                      hintText: "confirm the password"),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (passwordController.text ==
                                        ConfipasswordController.text) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  AppColors.backgroundColor,
                                              title: const Text(
                                                "Password Updated",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 25),
                                              ),
                                              content: const Text(
                                                "Your password has been successfully updated.",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.blackColor,
                                                    fontSize: 15),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontSize: 15),
                                                    ))
                                              ],
                                            );
                                          });
                                    } else if (passwordController
                                            .text.isEmpty ||
                                        ConfipasswordController.text.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  AppColors.backgroundColor,
                                              title: const Text(
                                                "Password not Updated",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 25),
                                              ),
                                              content: const Text(
                                                "all fields must be filled out",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.blackColor,
                                                    fontSize: 15),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontSize: 15),
                                                    ))
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  AppColors.backgroundColor,
                                              title: const Text(
                                                "Password not Updated",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 25),
                                              ),
                                              content: const Text(
                                                "password does not match",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.blackColor,
                                                    fontSize: 15),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontSize: 15),
                                                    ))
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Container(
                                    width: size.width / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: const Center(
                                      child: Text(
                                        "send ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ]))))))
    ])));
  }
}
