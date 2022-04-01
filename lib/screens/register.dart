import 'package:animation/widget/background.dart';
import 'package:animation/widget/editText.dart';
import 'package:animation/widget/loginButon.dart';
import 'package:animation/service/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

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
                'REGISTER',
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
                textEditingController: firstNameCtrl,
                hintText: 'First Name',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: EditText(
                suffixIcon: false,
                textEditingController: lastNameCtrl,
                hintText: 'Last Name',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: EditText(
                suffixIcon: false,
                textEditingController: emailCtrl,
                hintText: 'Email',
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
                            title: 'REGISTER',
                            onPress: () async {
                              isLoading.value = true;

                              bool success = await FirebaseService().register(
                                  emailCtrl.text,
                                  passwordCtrl.text,
                                  firstNameCtrl.text,
                                  lastNameCtrl.text);
                              if (success) {
                                Navigator.pop(context, {
                                  'username': emailCtrl.text,
                                  'password': passwordCtrl.text,
                                });
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
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Sign In',
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
