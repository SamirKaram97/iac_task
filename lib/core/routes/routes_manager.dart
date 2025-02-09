import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/login_fill_data.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/register_fill_data.dart';
import 'package:iac_task/features/auth/presentation/controllers/login/login_bloc.dart';
import 'package:iac_task/features/auth/presentation/controllers/register/register_bloc.dart';
import 'package:iac_task/features/auth/presentation/screens/login/login_screen.dart';
import 'package:iac_task/features/auth/presentation/screens/register/register_screen.dart';


class Routes {
  ///  Auth Routes
  static const String splashViewRoute = '/';
  static const String loginViewRoute = '/LoginView';
  static const String registerViewRoute = '/RegisterView';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
       case Routes.splashViewRoute:
         return transitionPage(const SplashScreen());
        case Routes.loginViewRoute:
          sl<LoginFillData>().init();
        return transitionPage(BlocProvider(
          create: (context) => sl<LoginBloc>(),
          child: const LoginScreen(),
        ));
      case Routes.registerViewRoute:
        sl<RegisterFillData>().init();
        return transitionPage(BlocProvider(
          create: (context) => sl<RegisterBloc>(),
          child: const RegisterScreen(),
        ));
      default:
        return transitionPage(Container());
    }
  }

  static Route<dynamic> unDefinedRoute() {

    return MaterialPageRoute(
      builder: (context) =>
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("AppStrings.noRouteFound",
                  style: TextStyle(fontSize: 20)),
            ),
            body: const SafeArea(
              child: Center(
                child:
                Text("AppStrings.noRouteFound", style: TextStyle(fontSize: 35)),
              ),
            ),
          ),
    );
  }

  static transitionPage(Widget page) {

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }


}

//just for routing testing
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(context, Routes.loginViewRoute);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

