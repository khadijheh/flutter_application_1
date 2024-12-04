import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/signIn.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'app_colors.dart';

class Chooselanguage extends StatefulWidget {
  const Chooselanguage({super.key});

  @override
  State<Chooselanguage> createState() => _ChooselanguageState();
}

class _ChooselanguageState extends State<Chooselanguage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height / 5),
            width: double.infinity,
            height: size.height,
            alignment: Alignment.topCenter,
            color: AppColors.secondaryColor,
            child: Image.asset(
              filterQuality: FilterQuality.medium,
              "images/deve.png",
              height: 190,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: size.height / 2,
            bottom: 0.4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              width: size.width,
              height: 500,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 70,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Delivary Order",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "توصيل طلبات",
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 30),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 30),
                    ),
                    const Text(
                      "please you choose the language of your application",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        width: size.width / 2,
                        height: 50,
                        child: const Text(
                          "English",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        width: size.width / 2,
                        height: 50,
                        child: const Text(
                          "Arabic",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
