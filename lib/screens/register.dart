import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:clairvoyant_tubes/screens/provider.dart'; // Import the UserProvider class

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _usernameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();
  final _confirmPasswordC = TextEditingController();

  Color floatingColor1 = Colors.grey;
  Color floatingColor2 = Colors.grey;
  Color floatingColor3 = Colors.grey;

  String validation = "";
  String? err3;
  String finalTempPassword = '';

  void buttonClick() {
    if (_passwordC.text != _confirmPasswordC.text) {
      setState(() {
        validation = "Passwords do not match";
        err3 = 'Passwords do not match';
        finalTempPassword = _confirmPasswordC.text;
      });
    } else {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.register(
        _usernameC.text,
        _emailC.text,
        _passwordC.text,
      );
      setState(() {
        validation = "Account successfully registered";
        err3 = null;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const Login();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  floatingColor1 = value ? Colors.redAccent : Colors.grey;
                });
              },
              child: TextFormField(
                controller: _usernameC,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  floatingColor2 = value ? Colors.redAccent : Colors.grey;
                });
              },
              child: TextFormField(
                controller: _emailC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  floatingColor3 = value ? Colors.redAccent : Colors.grey;
                });
              },
              child: TextFormField(
                controller: _passwordC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor3),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  floatingColor3 = value ? Colors.redAccent : Colors.grey;
                  if (finalTempPassword != _confirmPasswordC.text) {
                    err3 = null;
                  }
                });
              },
              child: TextFormField(
                controller: _confirmPasswordC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: floatingColor3),
                  ),
                  errorText: err3,
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
                onPressed: buttonClick,
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  validation,
                  style: TextStyle(
                    color: validation == "Account successfully registered"
                        ? Colors.blue
                        : Colors.red,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'OR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const Login();
                      }),
                    );
                  },
                  child: const Text(
                    "Login",
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
