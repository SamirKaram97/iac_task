import 'package:get_it/get_it.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/login_fill_data.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/register_fill_data.dart';
import 'package:iac_task/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:iac_task/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:iac_task/features/auth/data/strategy/login_email_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/login_facebook_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/login_google_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/register_email_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/register_facebook_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/register_google_strategy.dart';
import 'package:iac_task/features/auth/domain/repo/auth_repo.dart';
import 'package:iac_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:iac_task/features/auth/domain/use_cases/register_use_case.dart';
import 'package:iac_task/features/auth/presentation/controllers/login/login_bloc.dart';
import 'package:iac_task/features/auth/presentation/controllers/register/register_bloc.dart';

final GetIt sl = GetIt.instance;

class ServicesLocator {
  static Future<void> init() async {
    await setupAuthServices();
  }

  static Future<void> setupAuthServices() async {
    _initializeDataSources();
    _initializeRepositories();
    _initializeUseCases();
    _initializeBlocs();
    _initializeStrategies();
  }

  static void _initializeBlocs() {
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
  }

  static void _initializeUseCases() {
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));

  }

  static void _initializeRepositories() {
    sl.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(authRemoteDataSource: sl()));
  }

  static void _initializeDataSources() {
    sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());

    sl.registerLazySingleton<LoginFillData>(
            () => LoginFillData());

    sl.registerLazySingleton<RegisterFillData>(
            () => RegisterFillData());
  }

  static void _initializeStrategies() {
    sl.registerLazySingleton<FacebookLoginStrategy>(
            () => FacebookLoginStrategy(sl()));
    sl.registerLazySingleton<GoogleLoginStrategy>(
            () => GoogleLoginStrategy(sl()));
    sl.registerLazySingleton<EmailPasswordLoginStrategy>(
            () => EmailPasswordLoginStrategy(sl()));
    sl.registerLazySingleton<EmailPasswordRegisterStrategy>(
            () => EmailPasswordRegisterStrategy(sl()));
    sl.registerLazySingleton<GoogleRegisterStrategy>(
            () => GoogleRegisterStrategy(sl()));
    sl.registerLazySingleton<FacebookRegisterStrategy>(
            () => FacebookRegisterStrategy(sl()));
  }


}
