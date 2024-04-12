import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color floatingColor1 = Colors.grey;
  Color floatingColor2 = Colors.grey;
  Color floatingColor3 = Colors.grey;
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  TextEditingController finalInputPassword = TextEditingController();
  String finalTempPassword = '';
  String? err3 = null;

  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    floatingColor1 = Colors.redAccent;
                  });
                } else {
                  setState(() {
                    floatingColor1 = Colors.grey;
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
                ),
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
                  });
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
                  setState(() {
                    floatingColor3 = Colors.redAccent;
                  });
                } else {
                  setState(() {
                    floatingColor3 = Colors.grey;
                    if (finalTempPassword != finalInputPassword.text) {
                      err3 = null;
                    }
                  });
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
                  setState(() {
                    err3 = 'Unmatched password';
                    finalTempPassword = finalInputPassword.text;
                  });
                } else {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
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
