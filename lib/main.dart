//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/app/cubit/user_cubit.dart';
import 'package:flutter_application_1/app/modules/home/chooseLanguage.dart';
// import 'package:get/get.dart';
//import 'package:flutter_application_1/core/api/dio_consumer.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //CacheHelper().init();
  // runApp(BlocProvider(
  //   create: (context) => UserCubit(DioConsumer(dio: Dio())),
  //   child: MyApp(),
  // )
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chooselanguage(),
    );
  }
}
