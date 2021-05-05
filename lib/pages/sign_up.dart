import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup/pages/first_page.dart';
import 'package:signup/pages/sign_in.dart';
import 'package:signup/utils/custom_colors.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _secureText = true;
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var newEmailFocusNode = new FocusNode();
    var newPasswordFocusNode = new FocusNode();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please Sign Up',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 55),
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                    color: CustomColors.paleGray,
                    border: Border.all(color: CustomColors.gray, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _newEmailController,
                    focusNode: newEmailFocusNode,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        labelText: "New Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        isDense: false,
                        labelStyle: TextStyle(
                            color: newEmailFocusNode.hasFocus
                                ? CustomColors.darkGray
                                : Colors.black)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 55),
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                    color: CustomColors.paleGray,
                    border: Border.all(color: CustomColors.gray, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: TextField(
                    controller: _newPasswordController,
                    focusNode: newPasswordFocusNode,
                    obscureText: _secureText,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      isDense: false,
                      labelStyle: TextStyle(
                          color: newPasswordFocusNode.hasFocus
                              ? CustomColors.darkGray
                              : Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _secureText
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 55),
                    width: double.maxFinite,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: CustomColors.gray,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: CustomColors.purple),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );
                  }),
              GestureDetector(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: " Sign in",
                        style: TextStyle(color: CustomColors.purple))
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
