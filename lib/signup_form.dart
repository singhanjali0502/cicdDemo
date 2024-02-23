import 'package:flutter/material.dart';
import 'package:flutter_demo/view/home_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  RegExp reg = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!GetUtils.isEmail(value!)) {
                    return 'Email is required for Login';
                  }
                  if (!reg.hasMatch(value)) {
                    return 'Please Enter Valid Email';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return 'Password is required for login';
                  }
                  if (!regex.hasMatch(value)) {
                    return ('Enter valid password Min.6 characters');
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return 'Password is required for login';
                  }
                  if (!regex.hasMatch(value)) {
                    return ('Enter valid password Min.6 characters');
                  }
                },
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10)),
                width: 100,
                child: TextButton(
                    onPressed: () {
                      signIn(emailController.text, passwordController.text);
                    },
                    child: const Text(
                      "Sign In",
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Login Successfully');
      Get.to(HomeView());
    }
  }
}
