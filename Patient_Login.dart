import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psghospitalapp/Patient/Patient_Signup.dart';
import 'package:psghospitalapp/widget/button_widget.dart';
import 'package:psghospitalapp/widget/textfield_widget.dart';

class Patient_Login extends StatefulWidget {
  const Patient_Login({Key? key}) : super(key: key);
  @override
  _Patient_LoginState createState() => _Patient_LoginState();
}

class _Patient_LoginState extends State<Patient_Login> {
  bool mainPassObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: "Patient",
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width),
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width)),
                          image: DecorationImage(
                            image: AssetImage("Assets/Patient.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30.0, bottom: 15.0),
                        child: Text(
                          "Physiotherapist's Login",
                          style: GoogleFonts.lato(
                            color: Color(0xff4A64FE),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFieldWidget(
                        error: false,
                        index: 0, // TEMP VALUE
                        Num: true,
                        hintText: 'Physiotherapist ID',
                        obscureText: false,
                        prefixIconData: Icons.account_circle_outlined,
                        suffixIconData: Icons.check,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          onChanged: (value) {},
                          obscureText: mainPassObscure,
                          cursorColor: Color(0xff4A64FE),
                          style: GoogleFonts.lato(
                            color: Color(0xff4A64FE),
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xff4A64FE)),
                            focusColor: Color(0xff4A64FE),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xff4A64FE)),
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 18,
                              color: Color(0xff4A64FE),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                if (mainPassObscure) {
                                  setState(() {
                                    mainPassObscure = false;
                                  });
                                } else {
                                  setState(() {
                                    mainPassObscure = true;
                                  });
                                }
                              },
                              child: Icon(
                                mainPassObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 18,
                                color: Color(0xff4A64FE),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: ButtonWidget(
                      title: 'Login',
                      hasBorder: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => P_Signup()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: ButtonWidget(
                        title: 'Sign Up',
                        hasBorder: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
