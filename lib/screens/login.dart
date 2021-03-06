import 'package:animation/screens/home.dart';
import 'package:animation/screens/register.dart';
import 'package:animation/service/firebase_auth.dart';
import 'package:animation/widget/background.dart';
import 'package:animation/widget/editText.dart';
import 'package:animation/widget/loginButon.dart';
import 'package:animation/widget/page_router_builder.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 32.0),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Color.fromARGB(255, 19, 111, 185),
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: EditText(
                suffixIcon: false,
                textEditingController: usernameCtrl,
                hintText: 'Username',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: EditText(
                suffixIcon: true,
                textEditingController: passwordCtrl,
                hintText: 'Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Forgot your password?',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
              child: ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isLoading.value
                        ? const CircularProgressIndicator()
                        : ButtonPage(
                            title: 'LOGIN',
                            onPress: () async {
                              isLoading.value = true;

                              bool success = await FirebaseService()
                                  .login(usernameCtrl.text, passwordCtrl.text);
                              if (success) {
                                Navigator.of(context).pushReplacement(
                                    CustomPageRouter(
                                        begin: const Offset(2, 0),
                                        child: const Home()));
                              } else {
                                isLoading.value = false;
                              }
                            })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              margin: const EdgeInsets.only(right: 32),
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Don\'t Have an Account? ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 12),
                  ),
                  InkWell(
                    onTap: () async {
                      final account = await Navigator.of(context)
                          .push(CustomPageRouter(child: const Register()));
                      if (account != null) {
                        usernameCtrl.text = account['username'];
                        passwordCtrl.text = account['password'];
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
