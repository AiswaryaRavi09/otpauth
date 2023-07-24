import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otpauth/otp.dart';

import 'package:provider/provider.dart';

import 'loginservices.dart';

class LoginScreen extends StatefulWidget {
  const  LoginScreen({Key? key}) : super(key: key);
 static String verify='';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onImageClicked() {
  // Handle the click event here
  print('Image Clicked!');
  }
  late LoginService loginService;

  @override
  void initState() {
  // TODO: implement initState
  loginService = Provider.of<LoginService>(context, listen: false);
  super.initState();
  }
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(89, 77, 70, 70),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  SizedBox(height:150),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assetss/room.jpeg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,),
                      SizedBox(height: 28,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: const Text('Enter mobile number and login',
                              style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300)))
                    ],
                  ),


                  SizedBox(height: 15,),
                  Container(
                    height: 70,
                    constraints: const BoxConstraints(maxWidth: 400),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 5),

                      child: TextField(
                        autofocus: false,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile number',

                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                              left: 15.0, bottom: 14, top: 12.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.zero
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.zero
                          ),
                        ),
                        maxLength: 10,

                      ),
                    ),


const SizedBox(height: 20,),

                        GestureDetector(

                              onTap: () {
                                String phoneNumber = "+91${phoneController.text}";

                                loginService
                                    .loginWithOtpSent(phoneNumber: phoneNumber)
                                    .then(
                                      (value) {
                                    if (loginService.isCompleted!) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const OTP()));
                                    }
                                  },
                                );

                              }, // Image tapped
                              child: Image.asset(
                                'assetss/next.jpeg',
                                fit: BoxFit.cover, // Fixes border issues
                                width: 180.0,
                                height: 50.0,
                              ),
                            ),SizedBox(height: 50,),
                  Column(
                    children: [
                      Image.asset('assetss/pokerassociation.jpeg',
                      height: 100,
                      width: 100,)
                    ],
                  )

                        ],),


                      ),
                    ),
                  ),


    );

  }

}
