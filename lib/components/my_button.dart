// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../screens/authentication/resset_password.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  const MyButton({super.key, required this.onTap, required this.title});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isLoading = false;
  String? phonen;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: FadeInDown(
        delay: Duration(milliseconds: 600),
        child: MaterialButton(
          minWidth: double.infinity,
          
          onPressed: () {
            
            setState(() {
              _isLoading = true;
            });

            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                _isLoading = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RessetOtp(
                            phone: phonen.toString(),
                          )));
            });
          },
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                  widget.title,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
