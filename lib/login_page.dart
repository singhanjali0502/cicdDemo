import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_demo/signup_form.dart';
import 'package:flutter_demo/social_images.dart';
import 'login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation<double> _animationTextRotate;
  void setUpAnimation() {
    _animatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animatedController);
  }

  void updateView() {
    setState(() {
      _isShowSignup = !_isShowSignup;
    });
    _isShowSignup
        ? _animatedController.forward()
        : _animatedController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  bool _isShowSignup = false;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animatedController,
        builder: (context, _) {
          return Stack(
            children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  width: _size.width * 0.88,
                  height: _size.height,
                  right: _isShowSignup ? _size.width * 0.76 : 0,
                  child: Container(
                    color: Colors.green,
                    child: const LoginForm(),
                  )),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  height: _size.height,
                  width: _size.width * 0.88,
                  left: _isShowSignup ? _size.width * 0.12 : _size.width * 0.88,
                  child: Container(
                    color: const Color(0xFF0D3AA9),
                    child: const SignupForm(),
                  )),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: _size.height * 0.1,
                left: 0,
                right: _isShowSignup ? _size.width * 0.06 : _size.width * 0.06,
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white60,
                  child: Icon(Icons.watch_later_outlined),
                ),
              ),
              AnimatedPositioned(
                width: _size.width,
                bottom: _size.height * 0.1,
                  right: _size.width * 0.06,
                  duration:  const Duration(milliseconds: 300),
                child: const SocalButtns(),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  bottom: _isShowSignup ? _size.height / 2 - 120 : _size.height * 0.3,
                  left: _isShowSignup ? 0 : _size.width * 0.44 - 40,
                  child: SizedBox(
                    width: 160,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                          fontSize: _isShowSignup ? 20 : 32,
                          fontWeight: FontWeight.bold,
                          color: _isShowSignup?Colors.white:Colors.white70),
                      child: Transform.rotate(
                          angle: _animationTextRotate.value * pi / 180,
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap:updateView ,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                            "Log In".toUpperCase(),
                          )))),
                    ),
                  )),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  bottom: !_isShowSignup ? _size.height / 2 - 120 : _size.height * 0.3,
                  right: _isShowSignup ?  _size.width * 0.44 - 80:0,
                  child: SizedBox(
                    width: 160,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                          fontSize: _isShowSignup ? 32 : 20,
                          fontWeight: FontWeight.bold,
                          color: _isShowSignup?Colors.white70:Colors.white),
                      child: Transform.rotate(
                          angle: (90 - _animationTextRotate.value) * pi / 180,
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap:updateView ,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Sign In".toUpperCase(),
                                  )))),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
