import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:clairvoyant_tubes/screens/provider.dart'; // Import the UserProvider class

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    TextEditingController inputUsername = TextEditingController();
    TextEditingController inputPassword = TextEditingController();
    TextEditingController finalInputPassword = TextEditingController();

    Color floatingColor1 = Colors.grey;
    Color floatingColor2 = Colors.grey;
    Color floatingColor3 = Colors.grey;

    String finalTempPassword = '';
    String? err3;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                if (value) {
                  floatingColor1 = Colors.redAccent;
                } else {
                  floatingColor1 = Colors.grey;
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
                }
              },
              child: TextFormField(
                obscureText: true,
                controller: inputPassword,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: floatingColor2),
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                if (value) {
                  floatingColor3 = Colors.redAccent;
                } else {
                  floatingColor3 = Colors.grey;
                  if (finalTempPassword != finalInputPassword.text) {
                    err3 = null;
                  }
                }
              },
              child: TextFormField(
                obscureText: true,
                controller: finalInputPassword,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: floatingColor3),
                    labelText: 'Confirm Password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    errorText: err3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (inputPassword.text != finalInputPassword.text) {
                  err3 = 'Unmatched password';
                  finalTempPassword = finalInputPassword.text;
                } else {
                  userProvider.register(inputUsername.text, inputPassword.text);
                  if (userProvider.user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Home(
                              username: '',
                            )));
                  }
                }
              },
              child: Text('Register'),
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
                      'Register with Gmail',
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
                Text("Already have an account?"),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Log In'),
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
