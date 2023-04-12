// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:finance/constants/config.dart';
import 'package:finance/di/injection.dart';
import 'package:finance/postFields/register.dart';
import 'package:finance/repo_source/local/get_local_data.dart';
import 'package:finance/repo_source/local/local_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_cubit.dart';
import '../../routes/routes.gr.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  final LocalStorageManager localStorageManager = LocalStorageManager();
  final regCubit = locator<AuthCubit>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final idnumber = TextEditingController();
  final plate = TextEditingController();
  final license = TextEditingController();
  String? uid;
  // sign user in method
  bool _isLoading = false;
  String? phonen;
  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
    // regCubit.repository.registerUser(RegisterParams(
    //     username: "username", email: "email", password: "password"));
    _isLoading = false;
  }

  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    regCubit.close();
    super.dispose();
  }

  Future<void> fetchSecureStorageData() async {
    print(LocalStorage.email.key);
    uid = await localStorageManager.getUid(LocalStorage.uid.key) ?? '';
    // Object users=await localStorageManager.getUsers(LocalStorage.userobject.key) ?? [];
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/email.png"), fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Rizona," : " Back,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 130 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 480 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color.fromARGB(255, 187, 181, 171),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          // Positioned(
          //   top: MediaQuery.of(context).size.height - 100,
          //   right: 0,
          //   left: 0,
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(right: 20, left: 20, top: 15),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             // buildTextButton(Icons.facebook,
          //             //     "Facebook", Palette.facebookColor),
          //             // buildTextButton(Icons.golf_course,
          //             //     "Google", Palette.googleColor),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(
              idnumber, Icons.mail_outline, "info@demouri.com", false, true),
          buildTextField(passwordController, Icons.lock_outline, "**********",
              true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(
              idnumber, Icons.account_box_outlined, "ID Number", false, false),
          buildTextField(license, Icons.account_box_outlined, "License Number",
              false, false),
          buildTextField(
              plate, Icons.account_box_outlined, "Plate Number", false, false),
          buildTextField(
              passwordController, Icons.lock_outline, "password", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Palette.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : Palette.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor2,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Palette.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        print(state.status);
        print(widget.phone);
        // if (state.status.isLoading) {
        //   _isLoading = true;
        // } else if (state.status.isSuccess) {
        //   _isLoading = false;
        //   Future.delayed(const Duration(milliseconds: 2), () {
        //     AutoRouter.of(context).push(BottomNav());
        //   });
        //   print(state.user?.user?.email);
        //   print(state.message);
        //   localStorageManager.setPassword(state.user!.user!.email);
        //   // localStorageManager.setUserList("userobject",state.user as List);
        // }
        return AnimatedPositioned(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceInOut,
          top: isSignupScreen ? 570 : 430,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    if (showShadow)
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                      )
                  ]),
              child: !showShadow
                  ? BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state.status.isLoading) {
                          return Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.orange, Colors.green],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 1))
                                ]),
                            child: _isLoading
                                ? Container(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                      color: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.orange,
                                              Colors.green
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1))
                                        ]),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),

                            // color: Colors.black,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(5)),
                            // padding:
                            //     EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            // child: _isLoading
                            //     ? Container(
                            //         width: 20,
                            //         height: 20,
                            //         child: CircularProgressIndicator(
                            //           backgroundColor: Colors.white,
                            //           color: Colors.black,
                            //           strokeWidth: 2,
                            //         ),
                            //       )
                            //     : Text(
                            //         "Register",
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                          );
                        }
                        return MaterialButton(
                          onPressed: () {
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                _isLoading = false;
                              });
                              BlocProvider.of<AuthCubit>(context).registerUser(
                                  RegisterParams(
                                      phone: uid.toString(),
                                      id_number: idnumber.text,
                                      plate_number: plate.text,
                                      license_number: license.text,
                                      password: passwordController.text));
                            });
                          },
                          child: !showShadow
                              ? Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.orange, Colors.green],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(.3),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                )
                              : Center(),
                        );
                      },
                    )
                  : Center(),
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(controller, IconData icon, String hintText,
      bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
