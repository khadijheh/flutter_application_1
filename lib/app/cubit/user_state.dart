class UserState {}

final class UserInitial extends UserState {}

class SignInFailure {
  final String ErrorMessage;

  SignInFailure({required this.ErrorMessage});
  factory SignInFailure.fromJson(Map<String, dynamic> jsonData) {
    return SignInFailure(ErrorMessage: jsonData["ErrorMessage"]);
  }
}

class SignInSuccess extends UserState {}

class SignInLoading extends UserState {}

class UploadProfilePicture extends UserState {}
