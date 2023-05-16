import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/Screens/Signup/signup_screen.dart';
import 'package:fyp/constants.dart';

import '../../../Resources/auth_methods.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../login_screen.dart';
import 'login_background.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  late bool _obsecureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LogInBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //       fontStyle: FontStyle.italic),
            // ),
            Container(
              width: size.width - 60,
              height: size.height * 0.45,
              child: SvgPicture.asset(
                "assets/icons/login.svg",
                // height: size.height * 0.45,
                //width: 50,
              ),
            ),
            RoundedInputField(
              textEditingController: _emailController,
              hintText: 'Email',
              icon: Icons.person,
              onChanged: (String value) {},
            ),
            TextFieldContainer(
              child: TextField(
                controller: _passwordController,
                obscureText: _obsecureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.yellow[200],
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_obsecureText) {
                          _obsecureText = false;
                        } else {
                          _obsecureText = true;
                        }
                      });
                    },
                    child: Icon(
                      _obsecureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  //border: InputBorder.none
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  String res = await AuthMethods().loginUser(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (res == "Success") {
                    ClearFields();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                      content: const Text('User Not Found!'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {

                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  "Login".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );},
            ),
            SizedBox(
              height: 50,
            ), //For Allignment of Layout
          ],
        ),
      ),
    );
  }
  void ClearFields(){
    _emailController.text = "";
    _passwordController.text="";
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            fillColor: Colors.yellow[200],
            hintText: hintText),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      //height: 40,
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
