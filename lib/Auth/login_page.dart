// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arogya_mitra/Auth/register_page.dart';
import 'package:arogya_mitra/AuthServices/authService.dart';
import 'package:arogya_mitra/Widgets/widget.dart';
import 'package:arogya_mitra/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isPswdNotShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 70, bottom: 40),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/heart.png',
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Login to your Account',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: emailController,
                            key: emailFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Email can not be empty';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)) {
                                return "Please enter a valid email";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            key: passwordFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: isPswdNotShow,
                            controller: passwordController,
                            decoration: textInputDecoration.copyWith(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (isPswdNotShow == true) {
                                        isPswdNotShow = false;
                                      } else {
                                        isPswdNotShow = true;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_rounded,
                                    color: isPswdNotShow == true
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor,
                                  ),
                                )),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Password can not be empty";
                              } else if (val.length < 8) {
                                return 'Password must have atleast 8 characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              login();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0XFF0856DE),
                                    Color(0XFF88CBFD)
                                  ], // Define your gradient colors
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(
                                    8.0), // Match the button's shape
                              ),
                              height: 45,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Forgot the password?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                loginWithGoogle();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height:
                                    MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/google_logo.png', // Path to the Google logo image
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have an Account?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                                },
                                child: Text('Register here',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    )),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ));
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await AuthServices()
          .loginUserwithEmailandPassword(
              emailController.text.toLowerCase(), passwordController.text)
          .then((value) async {
        if (value == true) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          showSnackBar(context, Colors.red, value);
        }
      });
    }
  }

  loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    await AuthServices().googlesignInMethod().then((value) async {
      if (value == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
        setState(() {
          isLoading = false;
        });
      } else if (value == null) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, Colors.red, value);
      }
    });
  }
}
