import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: GoogleFonts.parisienne(
                  textStyle: TextStyle(
                fontSize: 65,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.orange.shade50,
              child: Container(
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange.shade700,
                ),
                child: Text("Log In"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot your password...?",
                  style: TextStyle(color: Colors.orange.shade700),
                ))
          ],
        ),
      ),
    ));
  }
}
