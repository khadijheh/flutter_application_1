import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/new_password.dart';
import 'package:page_transition/page_transition.dart';

import 'app_colors.dart';
import 'package:validators/validators.dart' as validators;

class SendVerifying extends StatefulWidget {
  const SendVerifying({super.key});

  @override
  State<SendVerifying> createState() => _SendVerifyingState();
}

class _SendVerifyingState extends State<SendVerifying> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  final String correctCode = "123456"; // استبدل هذا بالقيمة الصحيحة

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      String enteredCode =
          controllers.map((controller) => controller.text).join('');

      if (enteredCode == correctCode) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: NewPassword(),
            type: PageTransitionType.bottomToTop,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("the code entered is incorrect, try again"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void onChanged(String value, int index) {
    if (value.length == 1) {
      if (index < focusNodes.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

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
            "the verification",
            style: TextStyle(
                fontSize: 30,
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: SingleChildScrollView(
                      child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        const Text(
                          "Enter the code",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Form(
                          key: formKey,
                          child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(6, (index) {
                                  return Container(
                                    width: 40,
                                    //  margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: TextFormField(
                                      controller: controllers[index],
                                      focusNode: focusNodes[index],
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '',
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLength:
                                          1, // تحديد الحد الأقصى لعدد الأحرف إلى 1
                                      onChanged: (value) =>
                                          onChanged(value, index),
                                    ),
                                  );
                                })),
                          ),
                        ),

                        //    Container(
                        //         height: 30,
                        //         color: AppColors.greyColor,
                        //         width: (size.width / 1.2) / 12,
                        //         child: TextFormField(
                        //           autovalidateMode:
                        //               AutovalidateMode.onUnfocus,
                        //           enabled: true,
                        //           validator: (value) {
                        //             if (value == null ||
                        //                 value.isEmpty) {
                        //               return 'please enter your number of code ';
                        //             } else if (!validators
                        //                 .isNumeric(value)) {
                        //               return 'please enter the correct of code ';
                        //             } else if (value.length > 2) {
                        //               return 'you must be one number in the box';
                        //             }
                        //             return null;
                        //           },
                        //           decoration: InputDecoration(
                        //             hintText: "",
                        //           ),
                        //         ),
                        //       ),

                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            submit();
                          },
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
                                "verify",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ])))))
    ])));
  }
}
