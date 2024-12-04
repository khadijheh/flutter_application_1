import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/error/exeption.dart';
import 'package:flutter_application_1/app/cubit/user_state.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/api/endpoint.dart';
import 'package:flutter_application_1/models/sign_in_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  TextEditingController signInphone = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController signUpFirstName = TextEditingController();
  TextEditingController signUpLastName = TextEditingController();
  TextEditingController signUpLocation = TextEditingController();

  XFile? profilePic;
  SignInModels? user;
  uploadProfilePic(XFile image) {
    profilePic = image;
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(Endpoint.signIn,
          data: {ApiKey.numberPhone = signInphone.text as int});
      user = SignInModels.fromJson(response);
      //final decodedToKen=JwtDecoder.decode(user!.toKen);
      //CacheHelper().saveData(Key:ApiKey.toKen,value :user!.toKen);
      emit(SignInSuccess());
    } on ServerExeption catch (e) {
      emit(SignInFailure(ErrorMessage: e.errorModel.ErrorMessage) as UserState);
    }
  }
}
