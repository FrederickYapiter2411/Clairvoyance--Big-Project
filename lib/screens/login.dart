import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    TextEditingController inputUsername = TextEditingController();
    TextEditingController inputPassword = TextEditingController();

    Color floatingColor1 = Colors.grey;
    Color floatingColor2 = Colors.grey;

    String tempUsername = '';
    String tempPassword = '';
    String? err1;
    String? err2;

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
                  floatingColor1 = Colors.redAccent;
                } else {
                  floatingColor1 = Colors.grey;
                  if (tempUsername != inputUsername.text ||
                      tempPassword != inputPassword.text) {
                    err1 = null;
                    err2 = null;
                  }
                }
              },
              child: TextFormField(
                controller: inputUsername,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: inputUsername.text.isEmpty ? 'testing' : null,
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor1),
                  ),
                  errorText: err1,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                if (value) {
                  floatingColor2 = Colors.redAccent;
                } else {
                  floatingColor2 = Colors.grey;
                  if (tempUsername != inputUsername.text ||
                      tempPassword != inputPassword.text) {
                    err1 = null;
                    err2 = null;
                  }
                }
              },
              child: TextFormField(
                controller: inputPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: inputPassword.text.isEmpty ? 'testing' : null,
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor2),
                  ),
                  errorText: err2,
                ),
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
                  tempUsername = inputUsername.text;
                  tempPassword = inputPassword.text;
                } else {
                  userProvider.login(inputUsername.text, inputPassword.text);
                  if (userProvider.user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Home(
                        username: '',
                      ),
                    ));
                  }
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
                minimumSize: Size(double.infinity, 50),
              ),
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
              ),
            ),
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
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text('Register'),
                  style: TextButton.styleFrom(foregroundColor: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
