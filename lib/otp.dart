import 'package:flutter/material.dart';
import 'package:otpauth/tournament.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'loginservices.dart';

class OTP extends StatefulWidget {

  const OTP( {Key? key, }) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String text = '';
  late LoginService loginService;

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            borderRadius: BorderRadius.all(Radius.zero)),
        child: Center(
            child: Text(
              text[position],
              style: const TextStyle(color: Colors.deepOrangeAccent),
            )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            borderRadius: const BorderRadius.all(Radius.zero)),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    loginService = Provider.of<LoginService>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(89, 77, 70, 70),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(77),
              child: Column(
                children: <Widget>[
                  SizedBox(height:50),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assetss/room.jpeg',
                        width: 170,
                        height: 130,
                        fit: BoxFit.cover,),
                      SizedBox(height: 65,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text('Please enter the OTP',
                              style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300)))
                    ],
                  ),
                  SizedBox(height: 50,),

                  Pinput(
                    length: 6,
                    showCursor: true,
                  ),
                  SizedBox(height: 50,),



                  GestureDetector(

                    onTap: () {
                      loginService
                          .verifyOTP(otp: text)
                          .then(
                            (value) {
                          if (loginService.isOtpComplted!) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const Ticket()));
                          }
                          else{
                            var snackBar=SnackBar(content: Text("Otp is failed"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                      );
                    },// Image tapped
                    child: Image.asset(
                      'assetss/next.jpeg',
                      fit: BoxFit.cover, // Fixes border issues
                      width: 180.0,
                      height: 50.0,
                    ),
                  ),

                  SizedBox(height: 40),
                  // InkWell(
                  //   onTap: () {
                  //     loginService.loginWithOtpSent(phoneNumber: loginService.phoneNumberSave);
                  //
                  //   },
                  // ),
                  RichText(
                    text: const TextSpan(
                      children: [

                        TextSpan(
                          text: 'Resend OTP',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),

                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ),
        ),

        ),


    );
  }
}

