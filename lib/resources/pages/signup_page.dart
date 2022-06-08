import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/signup_controller.dart';

class SignupPage extends NyStatefulWidget {
  static const String route = "/signup";
  final SignupController controller = SignupController();

  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends NyState<SignupPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [
          Text('Signup'),
          TextField(
            decoration: InputDecoration(hintText: "email"),
          ),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          RaisedButton(
            child: Text('Signup'),
            onPressed: () {
              // widget.controller.signup();
            },
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              // widget.controller.login();
            },
          ),
        ]),
      )),
    );
  }
}
