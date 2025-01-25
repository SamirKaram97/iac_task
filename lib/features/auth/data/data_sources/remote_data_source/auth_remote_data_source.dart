import 'package:firebase_auth/firebase_auth.dart';
import 'package:iac_task/core/database/api/api_config.dart';
import 'package:iac_task/core/database/api/api_service.dart';
import 'package:iac_task/core/service/firebase_services.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/login_fill_data.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/register_fill_data.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserDataModel> loginEmailPassword();
  Future<UserDataModel> loginGoogle();
  Future<UserDataModel> loginFacebook();
  Future<void> registerEmailPassword();
  Future<void> registerGoogle();
  Future<void> registerFacebook();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<UserDataModel> loginEmailPassword() async {
    LoginFillData loginFillData = sl<LoginFillData>();
    var response =
        await APIService.post(endpoint: APIConfig.loginEndPoint, body: {
      "email": loginFillData.emailOrUsernameController.text,
      "password": loginFillData.passwordController.text
    });
    UserDataModel userModel = UserDataModel.fromJson(response.data);
    return userModel;
  }



  @override
  Future<void> registerEmailPassword() async {
    RegisterFillData registerFillData = sl<RegisterFillData>();

    await APIService.post(endpoint: APIConfig.registerEndPoint, body: {
      "email": registerFillData.emailController.text,
      "password": registerFillData.passwordController.text,
      "name": registerFillData.nameController.text,
      "phone": registerFillData.mobileNumberController.text,
      "dOB": registerFillData.dateOfBirthController.text,
    });
  }

  @override
  Future<UserDataModel> loginFacebook()async {
    var response=await FirebaseServices.signInWithFacebook();
    if(response==null) throw FirebaseException(plugin: "",message: AppStrings.socialAuthNotCompleted);
    UserDataModel user=UserDataModel.fromCredentials(response);
    return user;
  }

  @override
  Future<UserDataModel> loginGoogle()async {
    var response=await FirebaseServices.signInWithGoogle();
    if(response==null) throw FirebaseException(plugin: "",message: AppStrings.socialAuthNotCompleted);
    UserDataModel user=UserDataModel.fromCredentials(response);
    return user;
  }
  @override
  Future<void> registerFacebook() async {
    var response=await FirebaseServices.signInWithFacebook();
    if(response==null) throw FirebaseException(plugin: "",message: AppStrings.socialAuthNotCompleted);
  }

  @override
  Future<void> registerGoogle() async {
    var response=await FirebaseServices.signInWithGoogle();
    if(response==null) throw FirebaseException(plugin: "",message: AppStrings.socialAuthNotCompleted);
  }
}
