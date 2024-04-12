import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color floatingColor1 = Colors.grey;
  Color floatingColor2 = Colors.grey;
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  String tempUsername = '';
  String tempPassword = '';
  String? err1 = null;
  String? err2 = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 70),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                if (value) {
                  setState(() {
                    floatingColor1 = Colors.redAccent;
                  });
                } else {
                  setState(() {
                    floatingColor1 = Colors.grey;
                    if (tempUsername != inputUsername.text ||
                        tempPassword != inputPassword.text) {
                      err1 = null;
                      err2 = null;
                    }
                  });
                }
              },
              child: TextFormField(
                controller: inputUsername,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: floatingColor1),
                    labelText: 'Username',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    errorText: err1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                if (value) {
                  setState(() {
                    floatingColor2 = Colors.redAccent;
                  });
                } else {
                  setState(() {
                    floatingColor2 = Colors.grey;
                    if (tempUsername != inputUsername.text ||
                        tempPassword != inputPassword.text) {
                      err1 = null;
                      err2 = null;
                    }
                  });
                }
              },
              child: TextFormField(
                controller: inputPassword,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: floatingColor2),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    errorText: err2),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (inputUsername.text != 'testing' ||
                    inputPassword.text != 'testing') {
                  err1 = 'Wrong username and/or password';
                  err2 = 'Wrong username and/or password';
                  setState(() {
                    tempUsername = inputUsername.text;
                    tempPassword = inputPassword.text;
                  });
                } else {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Text('Log In'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'OR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Log In with Gmail',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text('Register'),
                  style: TextButton.styleFrom(foregroundColor: Colors.blue),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
