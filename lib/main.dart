import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazon_holdings/router/routes.dart';
import 'package:hazon_holdings/screens/login_screen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


