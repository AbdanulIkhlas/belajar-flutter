import 'package:flutter/material.dart';
import 'package:pengolahan_data_login/page/homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Login Page",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.teal,
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(height: 200.0),
                _usernameField(),
                _passwordField(),
                const SizedBox(height: 40.0),
                _loginButton(context),
              ],
            )));
  }

  Widget _usernameField() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Username'),
        onChanged: (value) {
          username = value;
        },
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(hintText: 'Password'),
        onChanged: (value) {
          password = value;
        },
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            String text = "";
            if (username == "admin" && password == "admin") {
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
            } else {
              setState(() {
                text = "Login Failed";
                isLoginSuccess = false;
              });
            }

            //! untuk menampilkan bukti sudah login di bottom
            SnackBar snackBar = SnackBar(
              content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            //! Navigasi ke homescreen (dapat menggunakan Navigator.push)
            if (isLoginSuccess) {
              // Navigator.pushReplacement digunakan agar di homescreen tdk ada button back <-
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                //! pindah navigasi dengan mengirimkan username
                return HomeScreen();
              }));
            }
          },
          child: Text('Login')),
    );
  }
}
