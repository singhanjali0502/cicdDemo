import 'package:flutter/material.dart';
import 'package:flutter_demo/view/home_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? update_version = '';

  @override
  void initState() {
    super.initState();
    getVersionNumber();
  }

  void getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      update_version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more complex email validation here if needed
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true, // to obscure the password
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                // You can add more complex password validation here if needed
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                // Implement forget password logic here
              },
              child: const Text(
                "Forget Passwords",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              child: TextButton(
                onPressed: () {
                  logIn(emailController.text, passwordController.text);
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
              ),),
                const SizedBox(height: 10,),
                if (update_version != null)
        Text(
        'Version: $update_version',
        style: const TextStyle(color: Colors.white),
      ),

            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  void logIn(String email, String password) {
    if (_formKey.currentState!.validate()) {
      // Your login logic goes here
      Fluttertoast.showToast(msg: 'Login Successfully');
      Get.to(HomeView());
    }
  }
}