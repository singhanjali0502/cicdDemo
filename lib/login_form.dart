import 'package:flutter/material.dart';
import 'package:flutter_demo/view/home_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: _formKey,
          child: Column(
        children: [
          const Spacer(),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Forget Passwords",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(10)),
            width: 100,
            child: TextButton(
                onPressed: () {
                  logIn(emailController.text, passwordController.text);
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      )),
    );
  }

void logIn(String email, String password) async {
  if (_formKey.currentState!.validate()) {
    Fluttertoast.showToast(msg: 'Login Successfully');
    Get.to(HomeView());
  }
}
}
