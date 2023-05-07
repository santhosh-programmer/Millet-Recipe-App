import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/auth/login_page.dart';
import 'package:millet_recipe_app/views/auth/reset_pass_page.dart';
import 'package:millet_recipe_app/views/home/homePage.dart';

final styling = TextStyle(color: appColor2);

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  _RegisterNowState createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  bool p = true;
  bool p1 = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var using1 = Icons.remove_red_eye;

  var enteredmail1 = '';
  var name = '';
  var enteredpass1 = '';
  var newtext1;
  var newpass1;
  var enteredpass2 = '';
  var newpass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor2,
          title: Text("New Registration"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (newtext1) {
                      name = newtext1;
                    },
                    style: styling,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor2 ?? appColor2),
                      ),
                      hintText: 'Enter your name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: appColor2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newtext1) {
                      enteredmail1 = newtext1;
                    },
                    style: styling,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor2 ?? appColor2),
                      ),
                      hintText: 'Enter your e-mail address',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: appColor2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newpass1) {
                      enteredpass1 = newpass1;
                    },
                    style: styling,
                    obscureText: p,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      hintText: 'Enter your Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor2 ?? appColor2),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: appColor2,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (using == openeye) {
                              using = closeeye;
                            } else {
                              using = openeye;
                            }
                            setState(() {
                              if (p == false) {
                                p = true;
                              } else {
                                p = false;
                              }
                            });
                          },
                          icon: Icon(
                            using,
                            color: appColor2,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newpass2) {
                      enteredpass2 = newpass2;
                    },
                    style: styling,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: p1,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor2 ?? appColor2), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor2 ?? appColor2),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: appColor2,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (using1 == openeye) {
                              using1 = closeeye;
                            } else {
                              using1 = openeye;
                            }
                            setState(() {
                              if (p1 == false) {
                                p1 = true;
                              } else {
                                p1 = false;
                              }
                            });
                          },
                          icon: Icon(
                            using1,
                            color: appColor2,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Container(
                      width: double.infinity,
                      height: 54.0,
                      child: !loading
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(appColor2),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              onPressed: () async {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(enteredmail1);
                                if (enteredmail1 == '' ||
                                    enteredpass1 == '' ||
                                    enteredpass2 == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Fill all the fields properly"),
                                    backgroundColor: appColor2,
                                  ));
                                } else {
                                  if (emailValid == true) {
                                    if (enteredpass1.length >= 6) {
                                      if (enteredpass2 == enteredpass1) {
                                        try {
                                          setState(() {
                                            loading = true;
                                          });
                                          // await imp.signup(
                                          //     mail: enteredmail1,
                                          //     pass: enteredpass1,
                                          //     name: name);
                                          setState(() {
                                            loading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Registered Successfully"),
                                            backgroundColor: appColor2,
                                          ));
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()),
                                              (Route<dynamic> route) => false);
                                        } on Exception catch (e) {
                                          print(e);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(e.toString()),
                                            backgroundColor: appColor2,
                                          ));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Passwords do not match"),
                                          backgroundColor: appColor2,
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Passwords must be atleast 6 characters"),
                                        backgroundColor: appColor2,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Enter a valid Mail-Id"),
                                      backgroundColor: appColor2,
                                    ));
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: appColor2,
                              ),
                            )),
                ],
              ),
            ),
          ),
        ));
  }
}
