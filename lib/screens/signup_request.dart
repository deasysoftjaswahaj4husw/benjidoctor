import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/signup_request/strings.dart'
    as local_strings;
import 'package:benjidoctor/resources/signup_request/constants.dart'
    as local_constants;

import 'package:benjidoctor/screens/signup_attempt.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRequestScreen extends StatefulWidget {
  const SignUpRequestScreen({Key? key}) : super(key: key);

  @override
  _SignUpRequestScreenState createState() => _SignUpRequestScreenState();
}

class _SignUpRequestScreenState extends State<SignUpRequestScreen> {
  final signUpRequestFormKey = GlobalKey<FormState>();
  final phoneNumberFieldController = TextEditingController();

  bool userExists = false;
  bool isValidPhoneNumber = true;
  bool showLoader = false;

  FirebaseAuth authInstance = FirebaseAuth.instance;



  signUpRequestForm() {
    return Padding(
      padding: global_constants.PADDING.p1,
      child: Form(
        key: signUpRequestFormKey,
        child: TextFormField(
          controller: phoneNumberFieldController,
          decoration: local_constants.TEXTFORMFIELD_STYLES.phone_number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is required';
            }

            return null;
          },
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  phoneVerificationComplete(credential) async {}

  phoneVerificationFailed(error) async {}

  phoneVerificationCodeSent(id, resendToken) async {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SignUpAttemptScreen(id: id);
    }));
  }

  phoneVerificationCodeAutoRetrievalTimeOut(id) async {}

  signUpRequest() async {
    setState(() {
      showLoader = true;
    });

    await authInstance.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumberFieldController.text,
        verificationCompleted: phoneVerificationComplete,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneVerificationCodeSent,
        codeAutoRetrievalTimeout: phoneVerificationCodeAutoRetrievalTimeOut);

    setState(() {
      showLoader = false;
    });
  }

  validatePhoneNumber() {
    String phoneNumber = phoneNumberFieldController.text;

    if (phoneNumber.length != 10) {
      setState(() {
        isValidPhoneNumber = false;
      });

      return false;
    } else {
      setState(() {
        isValidPhoneNumber = true;
      });

      return true;
    }
  }

  checkForExistingAccount() async {
    setState(() {
      showLoader = true;
    });

    String url = 'https://104.248.233.75/api/auth/signup' +
        phoneNumberFieldController.text;

    var phonenumberFieldController;
    String data = jsonEncode({
      'phone': phonenumberFieldController.text
    });

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer ",
    };

    http.Response response = await http.post(Uri.parse(url), headers: headers, body: data,);

    setState(() {
      showLoader = false;
    });

    final body = jsonDecode(response.body);

    if (response.statusCode == 404) {
      setState(() {
        userExists = false;
      });

      signUpRequest();
    } else {
      if (response.statusCode == 200) {
        setState(() {
          userExists = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final device_height = MediaQuery.of(context).size.height;
    final device_width = MediaQuery.of(context).size.width;

    Widget header = Container(
      width: device_width > 800 ? device_width * 0.4 : device_width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            global_constants.IMAGE.wave,
          ),
        ),
      ),
      child: Image.asset(
        global_constants.IMAGE.app_logo,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: global_constants.PADDING.p4,
          child: !showLoader
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      header,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 40.0),
                              const Text(
                                local_strings.HEADINGS.heading,
                                style: local_constants.TEXT_STYLES.heading,
                              ),
                              const SizedBox(height: 40.0),
                              SizedBox(
                                width: device_width > 800
                                    ? device_width * 0.4
                                    : device_width * 0.8,
                                child: signUpRequestForm(),
                              ),
                              Visibility(
                                visible: !isValidPhoneNumber,
                                child: const Text(
                                  local_strings.ERRORS.invalid_phone_number,
                                  style: local_constants
                                      .ERROR_STYLES.default_style,
                                ),
                              ),
                              Visibility(
                                visible: userExists,
                                child: const Text(
                                  local_strings.ERRORS.account_exists,
                                  style: local_constants
                                      .ERROR_STYLES.default_style,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              local_strings.LINKS.next,
                              style: local_constants.LINK_STYLES.next,
                            ),
                            Image.asset(global_constants.IMAGE.arrow_right)
                          ],
                        ),
                        onTap: () {
                          if (signUpRequestFormKey.currentState!.validate()) {
                            if (validatePhoneNumber()) {
                              checkForExistingAccount();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
