import 'package:flutter/material.dart';
import 'package:flutter_demo/view/home_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart'; // Import package_info_plus

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Variable to hold the version number
  String _version = '';

  @override
  void initState() {
    super.initState();
    // Fetch and set the version number when the widget is initialized
    _fetchVersion();
  }

  // Function to fetch the version number from the pubspec.yaml file
  Future<void> _fetchVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
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
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forget Passwords",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(10)),
              width: 100,
              child: TextButton(
                onPressed: () {
                  _login(emailController.text, passwordController.text);
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            // Display the version number
            Text(
              'Version: $_version',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _login(String email, String password) {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Login Successfully');
      Get.to(HomeView());
    }
  }
}