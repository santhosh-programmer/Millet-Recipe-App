import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/auth/register_now_page.dart';
import 'package:millet_recipe_app/views/auth/reset_pass_page.dart';
import 'package:millet_recipe_app/views/home/homePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

Color appColor = Colors.white;
bool loading = false;

class _LoginState extends State<Login> {
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var enteredmail = '';
  var enteredpass = '';
  var newtext;
  var newpass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/1162962131/photo/grains-and-millets-served-on-bowl-in-a-wooden-background.jpg?s=612x612&w=0&k=20&c=bl3xE6yBheomOvNP9C6t5WRwDXmGHDUQOooN9eAF57A="),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      'Millets Recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColor,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                  TextFormField(
                    onChanged: (newtext) {
                      enteredmail = newtext;
                    },
                    style: TextStyle(color: appColor),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter your e-mail address',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: appColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: appColor), //<-- SEE HERE
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: appColor), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 4, color: appColor), //<-- SEE HERE
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: appColor,
                        ),
                        hintStyle: TextStyle(color: appColor)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newpass) {
                      enteredpass = newpass;
                    },
                    style: TextStyle(color: appColor),
                    obscureText: p,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: appColor), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: appColor), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4, color: appColor), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: appColor),
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(color: appColor),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: appColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (p == false) {
                                p = true;
                              } else {
                                p = false;
                              }
                              if (using == openeye) {
                                using = closeeye;
                              } else {
                                using = openeye;
                              }
                            });
                          },
                          icon: Icon(
                            using,
                            color: appColor,
                          )),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MailOtp()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900,
                          color: appColor,
                        ),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: double.infinity,
                      height: 54.0,
                      child: !loading
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(appColor),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              onPressed: () async {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(enteredmail);
                                if (enteredmail == '' || enteredpass == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Fill all the fields properly",
                                      style: TextStyle(color: appColor),
                                    ),
                                    backgroundColor: Colors.black54,
                                  ));
                                } else {
                                  if (emailValid == true) {
                                    try {
                                      setState(() {
                                        loading = true;
                                      });
                                      // await imp.signin(
                                      //     mail: enteredmail, pass: enteredpass);
                                      setState(() {
                                        loading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Logged in Successfully",
                                          style: TextStyle(color: appColor),
                                        ),
                                        backgroundColor: Colors.black54,
                                      ));
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                        (Route<dynamic> route) => false,
                                      );
                                    } on Exception catch (e) {
                                      print(e);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          e.toString(),
                                          style: TextStyle(color: appColor),
                                        ),
                                        backgroundColor: Colors.black54,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Enter a valid Mail-Id",
                                        style: TextStyle(color: appColor),
                                      ),
                                      backgroundColor: Colors.black54,
                                    ));
                                  }
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 25.0),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: appColor,
                              ),
                            )),
                  SizedBox(
                    height: 30.0,
                  ),
                  Divider(
                    color: appColor,
                    thickness: 1.5,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: appColor,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterNow()));
                            },
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
