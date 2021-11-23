import 'package:flutter/material.dart';
import 'package:front_exa2_helmerm/home.dart';
import 'package:front_exa2_helmerm/login_page.dart';
import 'package:front_exa2_helmerm/services/titulos_services.dart';
import 'package:front_exa2_helmerm/titulos_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TitulosServices())],
      child: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titulos App',
      initialRoute: 'login',
      routes: {
        'home': (_) => HomePage(),
        'titulos': (_) => TitulosPage(),
        'login': (_) => LoginPage(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.orange.shade50,
          appBarTheme:
              AppBarTheme(elevation: 0, color: Color.fromRGBO(255, 87, 51, 1)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
