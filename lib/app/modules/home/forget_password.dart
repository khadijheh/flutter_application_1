import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/send_verifying.dart';
import 'package:page_transition/page_transition.dart';

import 'app_colors.dart';
import 'package:validators/validators.dart' as validators;

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? phone;
  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: SendVerifying(), type: PageTransitionType.bottomToTop));
    }
  }

  void dispose() {
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: size.height / 5),
        width: double.infinity,
        height: size.height,
        alignment: Alignment.topCenter,
        color: AppColors.secondaryColor,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "forget password",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondaryColor),
                                ),
                                const SizedBox(
                                  height: 50,
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
                                        Icons.phone,
                                        color: AppColors.blackColor,
                                      ),
                                      hintText: "Enter your phone number"),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    submit();
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
                                        "send a verifying",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ]))))))
    ])));
  }
}
