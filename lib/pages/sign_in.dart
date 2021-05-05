import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup/pages/first_page.dart';
import 'package:signup/pages/sign_up.dart';
import 'package:signup/utils/custom_colors.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _secureText = true;
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var emailFocusNode = new FocusNode();
  var passwordFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(''),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                    width: 180,
                    height: 180,
                    child: Image.asset('assets/fluttericin.png')),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 25,
                      color: CustomColors.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'We are happy to see you here again.\nPlease sign in yo find your favourite projects.',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
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
                    controller: _emailController,
                    focusNode: emailFocusNode,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        labelText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        isDense: false,
                        labelStyle: TextStyle(
                            color: emailFocusNode.hasFocus
                                ? CustomColors.darkGray
                                : Colors.black)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
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
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
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
                          color: passwordFocusNode.hasFocus
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
              SizedBox(height: 7.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style:
                      TextStyle(fontSize: 12, color: CustomColors.darkGray),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 55),
                  width: double.maxFinite,
                  height: 55,
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: CustomColors.purple),
                ),
                onTap: () {
                  setState(() {
                    validation();
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: " Sign up",
                        style: TextStyle(color: CustomColors.purple))
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validation() {
    int a = 0;
    var haveError = false;
    var errorMessage = "";
    if (_emailController.text != 'berk-yildiz-46@hotmail.com') {
      haveError = true;
      errorMessage = 'Wrong email, please try again later!';
    }
    else{
      a +=1;
    }
    if (_passwordController.text != 'sifre123') {
      haveError = true;
      errorMessage = errorMessage + '\nWrong password, please try again later!';
    }

    if (haveError) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: Text(errorMessage)));
    }
    else{
      a +=1;
    }
    if (a == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirstPage(),
        ),
      );
    }
  }
}