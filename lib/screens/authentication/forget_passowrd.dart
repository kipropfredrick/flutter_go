// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:finance/bloc/user_cubit.dart';
import 'package:finance/constants/config.dart';
import 'package:finance/repo_source/local/local_resource.dart';
import 'package:finance/routes/routes.gr.dart';
import 'package:finance/screens/authentication/login_page.dart';
// import 'package:finance/screens/authentication/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
   final LocalStorageManager localStorageManager = LocalStorageManager();
  bool _isLoading = false;
  String? phonen;
  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    // regCubit.close();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
             if (state.status.isLoading) {
          _isLoading = true;
        } else if (state.status.isSuccess) {
          _isLoading = false;
          Future.delayed(const Duration(milliseconds: 2), () {
            AutoRouter.of(context).push(RessetOtp(phone: controller.text));
          });
          print(state.user?.user?.email);
          print(state.message);
          localStorageManager.setId(state.user!.user!.id.toString());
          // localStorageManager.setUserList("userobject",state.user as List);
        }
        return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(
                  //   'https://ouch-cdn2.icons8.com/n9XQxiCMz0_zpnfg9oldMbtSsG7X6NwZi_kLccbLOKw/rs:fit:392:392/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDMv/MGE2N2YwYzMtMjQw/NC00MTFjLWE2MTct/ZDk5MTNiY2IzNGY0/LnN2Zw.png',
                  //   fit: BoxFit.cover,
                  //   width: 280,
                  // ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  FadeInDown(
                    child: Text(
                      'Register With Phone Number',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.grey.shade900),
                    ),
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      child: Text(
                        'Enter your phone number to continue, we will send you OTP to verifiy.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 400),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: Colors.black.withOpacity(0.13)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                              phonen = number.phoneNumber;
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            textFieldController: controller,
                            formatInput: false,
                            maxLength: 9,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            cursorColor: Colors.black,
                            inputDecoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(bottom: 15, left: 0),
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 16),
                            ),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                          Positioned(
                            left: 90,
                            top: 8,
                            bottom: 8,
                            child: Container(
                              height: 40,
                              width: 1,
                              color: Color.fromARGB(255, 201, 183, 183)
                                  .withOpacity(0.13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField(emailController, Icons.mail_outline,
                      "info@demouri.com", false, true),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField(fname, Icons.person, "First Name", false, true),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField(
                      lname, Icons.person_2_outlined, "Last name", false, true),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Back To?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // InkWell(
                        //   onTap: () {
                        //      Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => ResetPassword(
                        //                   )));
                        //   },
                        //   child: Text(
                        //     'Forgot Password?',
                        //     style: TextStyle(color: Colors.grey[600]),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state.status.isLoading) {
                        return CircularProgressIndicator();
                      }
                      return FadeInDown(
                        delay: Duration(milliseconds: 600),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            BlocProvider.of<AuthCubit>(context).registerUsers(
                              controller.text,
                              controller.text,
                              fname.text,
                              lname.text,
                            );
                            if (state.status.isSuccess) {
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading = false;
                                });
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginSignupScreen(
                                //               phone: phonen.toString(),
                                //             )));
                              });
                            } else if (state.status.isSuccess) {
                              Center(
                                child: Container(
                                  child: Text("Error while saving data"),
                                  // AutoRouter.of(context).pop();
                                ),
                              );
                            }
                          },
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                              : Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
          },
        ));
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
