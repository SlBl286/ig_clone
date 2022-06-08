import 'package:flutter/material.dart';
import 'package:ig_clone/app/events/login_event.dart';
import 'package:ig_clone/app/events/save_user_event.dart';
import 'package:ig_clone/bootstrap/helpers.dart';
import 'package:ig_clone/resources/pages/home_page.dart';
import 'package:ig_clone/resources/pages/signup_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/login_controller.dart';

class LoginPage extends NyStatefulWidget {
  static const String route = "/login";
  final LoginController controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {
  String? _email;
  String? _password;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  @override
  init() async {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage(
                getImageAsset('1308931.jpg'),
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Column(children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF46364D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text("Sign in to ig clone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: _emailController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _email = value;
                        } else {
                          _email = null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _password = value;
                        } else {
                          _password = null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () async {
                        if (_email == null || _password == null) {
                          print("Email or password is empty");
                        } else {
                          var token = await widget.controller
                              .login(_email!, _password!);
                          print(token);
                          if (token != null) {
                            event<LoginEvent>(data: {
                              "user_token": token,
                            });
                            var user = await widget.controller.getUser();
                            event<SaveUserEvent>(data: {
                              "user": user,
                            });
                            routeTo(MyHomePage.route,
                                navigationType: NavigationType.pushReplace);
                          }
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Color(0xFF46364D)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () => routeTo(SignupPage.route,
                              navigationType: NavigationType.pushReplace),
                          child: Container(
                            color: Colors.red,
                            child: Text(
                              " Sign up",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
