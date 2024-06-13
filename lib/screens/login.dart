import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/home.dart';
import 'package:clairvoyant_tubes/screens/register.dart';
import 'package:provider/provider.dart';

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
  bool isLoading = false;

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
        setState(() {
          isLoading = true;
        });
        showDialog(
            context: context,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            });
        Future.delayed(const Duration(seconds: 5), () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              padding: const EdgeInsets.all(8),
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Success",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Login is successful",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 3,
          ));
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home(user: user)),
            (route) => false,
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          err1 = 'Wrong email and/or password';
          err2 = 'Wrong email and/or password';
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Container(
            padding: const EdgeInsets.all(8),
            height: 90,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oh no !!!!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Login is unsuccessful \nPlease try again!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ))
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 3,
        ));
      }
    } else {
      setState(() {
        err1 = 'Wrong email and/or password';
        err2 = 'Wrong email and/or password';
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          height: 90,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oh no !!!!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Login is unsuccessful \nPlease try again!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 3,
      ));
    }
    setState(() {
      isLoading = false;
    });
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
