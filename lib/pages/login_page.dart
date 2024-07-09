import 'package:shopping_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isError = false;

  void checkLogin() {
    var un = controllerUsername.text;
    var psw = controllerPassword.text;
    if (un == 'admin' && psw == 'admin123') {
      isAdmin = true;
      context.go("/admin");
    } else {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 43,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: controllerUsername,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                Visibility(
                  visible: isError,
                  child: const Text(
                    'Username or password are incorrect',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: checkLogin,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    alignment: Alignment.center,
                    height: 55,
                    width: 320,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
