import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  Color floatingColor1 = Colors.grey;
  Color floatingColor2 = Colors.grey;
  String? err1;
  String? err2;
  String tempEmail = '';
  String tempPassword = '';

  void _login(BuildContext ctx) {
    List<Map<String, dynamic>> accountExist =
        listUsers.where((user) => user["email"] == _emailC.text).toList();

    if (accountExist.isNotEmpty) {
      Map<String, dynamic> account = accountExist[0];

      if (account["email"] == _emailC.text &&
          account["password"] == _passwordC.text) {
        User user = User(
          username: account['user_name'],
          email: account['email'],
          password: account['password'],
        );

        Navigator.of(ctx).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home(user: user)),
          (route) => false,
        );
      } else {
        setState(() {
          err1 = 'Wrong email and/or password';
          err2 = 'Wrong email and/or password';
        });
      }
    } else {
      setState(() {
        err1 = 'Wrong email and/or password';
        err2 = 'Wrong email and/or password';
      });
    }
  }

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
                setState(() {
                  if (value) {
                    floatingColor1 = Colors.redAccent;
                  } else {
                    floatingColor1 = Colors.grey;
                    if (tempEmail != _emailC.text ||
                        tempPassword != _passwordC.text) {
                      err1 = null;
                      err2 = null;
                    }
                  }
                });
              },
              child: TextFormField(
                controller: _emailC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor1),
                  ),
                  errorText: err1,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  if (value) {
                    floatingColor2 = Colors.redAccent;
                  } else {
                    floatingColor2 = Colors.grey;
                    if (tempEmail != _emailC.text ||
                        tempPassword != _passwordC.text) {
                      err1 = null;
                      err2 = null;
                    }
                  }
                });
              },
              child: TextFormField(
                controller: _passwordC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor2),
                  ),
                  errorText: err2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blue,
                ),
                onPressed: () {
                  _login(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'OR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
