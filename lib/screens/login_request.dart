
import 'package:benjidoctor/screens/clients.dart';
import 'package:benjidoctor/screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/globals/strings.dart' as global_strings;

import 'package:benjidoctor/resources/login_request/strings.dart'
    as local_strings;
import 'package:benjidoctor/resources/login_request/constants.dart'
    as local_constants;

import 'package:benjidoctor/screens/login_attempt.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRequestScreen extends StatefulWidget {
  const LoginRequestScreen({Key? key}) : super(key: key);

  @override
  _LoginRequestScreenState createState() => _LoginRequestScreenState();
}

class _LoginRequestScreenState extends State<LoginRequestScreen> {
  final loginRequestFormKey = GlobalKey<FormState>();
  final phoneNumberFieldController = TextEditingController();

  bool userExists = true;
  bool isValidPhoneNumber = true;
  bool showLoader = false;

  FirebaseAuth authInstance = FirebaseAuth.instance;

  loginRequestForm() {
    return Padding(
      padding: global_constants.PADDING.p1,
      child: Form(
        key: loginRequestFormKey,
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
    if (id != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginAttemptScreen(
            phone: phoneNumberFieldController.text, id: id);
      }));
    }
  }

  phoneVerificationCodeAutoRetrievalTimeOut(id) async {}

  loginRequest() async {
    setState(() {
      showLoader = true;
    });

    await authInstance.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumberFieldController.text,
        verificationCompleted: phoneVerificationComplete,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneVerificationCodeSent,
        codeAutoRetrievalTimeout: phoneVerificationCodeAutoRetrievalTimeOut);
  }

  validatePhoneNumber() {
    String phoneNumber = phoneNumberFieldController.text;

    if (phoneNumber.length != 10) {
      setState(() {
        isValidPhoneNumber = false;
        userExists = true;
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

    String url =
        global_strings.SERVER_URL + global_strings.ENDPOINTS.auth_check;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer ",
    };

    String data = jsonEncode({
      'phone': phoneNumberFieldController.text,
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: data);

    setState(() {
      showLoader = false;
    });

    final body = jsonDecode(response.body);

    if (response.statusCode == 404) {
      setState(() {
        userExists = false;
      });
    } else {
      if (response.statusCode == 200) {
        setState(() {
          userExists = true;
        });

        loginRequest();
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                child: loginRequestForm(),
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
                                visible: !userExists,
                                child: const Text(
                                  local_strings.ERRORS.account_does_not_exist,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()),
    );

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
