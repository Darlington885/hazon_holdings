

import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // case MyApp.routeName:
      //   return MaterialPageRoute(builder: (_) => MyApp());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());



      default:
      // If there is no such named route in the switch statement, e.g. /third
      // return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}