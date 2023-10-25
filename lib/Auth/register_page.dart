// ignore_for_file: prefer_const_constructors

import 'package:arogya_mitra/Auth/login_page.dart';
import 'package:arogya_mitra/AuthServices/authService.dart';
import 'package:arogya_mitra/Widgets/widget.dart';
import 'package:arogya_mitra/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //form keys
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  //variables
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
                      left: 20, right: 20, top: 50, bottom: 40),
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
                              'Let\'s you in',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          TextFormField(
                            controller: userNameController,
                            key: userNameFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                )),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Name can not be empty';
                              } else if (RegExp(
                                      r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                  .hasMatch(val)) {
                                return "Please enter a valid name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 23,
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
                            height: 23,
                          ),
                          TextFormField(
                            obscureText: isPswdNotShow,
                            controller: passwordController,
                            key: passwordFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            height: 23,
                          ),
                          InkWell(
                            onTap: () {
                              register();
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
                                'Register',
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
                              'Or continue with',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                registerWithGoogle();
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
                                "Already Have an Account?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                                },
                                child: Text('Login Now',
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await AuthServices()
          .signUpUserwithEmailandPassword(userNameController.text,
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

  registerWithGoogle() async {
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
