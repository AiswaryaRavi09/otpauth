

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otpauth/login_screen.dart';
import 'package:otpauth/tournament.dart';

import 'main.dart';
class LoginService extends ChangeNotifier{
  String phoneNumberSave="";
  bool _isCompleted= false;
  bool? get isCompleted => _isCompleted;
  bool _isOtpCompleted= false;
  bool? get isOtpComplted => _isOtpCompleted;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _verificationId;


  Future<void> loginWithOtpSent({required String phoneNumber})async{
    phoneNumberSave=phoneNumber;

    await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {


        },
        codeSent: (verificationId, int? resendToken) {
          LoginScreen.verify = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        },
        phoneNumber: phoneNumber);
    _isCompleted =true;
  }
  Future<void> signInWithPhone(PhoneAuthCredential credential) async {
    try {
      _firebaseAuth.signInWithCredential(credential);
      _isOtpCompleted=true;
    } on FirebaseAuthException catch (ex) {
      _isOtpCompleted=false;
    }
  }
  Future<void> verifyOTP({required String otp}) async {
    _isOtpCompleted =false;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);


    _isOtpCompleted=true;
  }
}