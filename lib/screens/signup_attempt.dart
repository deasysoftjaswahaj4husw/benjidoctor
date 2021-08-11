import 'package:flutter/material.dart';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/signup_attempt/strings.dart'
    as local_strings;
import 'package:benjidoctor/resources/signup_attempt/constants.dart'
    as local_constants;

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:benjidoctor/screens/update_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpAttemptScreen extends StatefulWidget {
  final id;

  const SignUpAttemptScreen({Key? key, this.id}) : super(key: key);

  @override
  _SignUpAttemptScreenState createState() => _SignUpAttemptScreenState();
}

class _SignUpAttemptScreenState extends State<SignUpAttemptScreen> {
  TextEditingController otpTextFieldController = TextEditingController();

  FirebaseAuth authInstance = FirebaseAuth.instance;

  final otpFormKey = GlobalKey<FormState>();

  bool otpError = false;

  otpForm() {
    return Padding(
      padding: global_constants.PADDING.p1,
      child: Form(
        key: otpFormKey,
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: true,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldHeight: 60.0,
              fieldWidth: 50.0,
              activeFillColor: Colors.white,
              inactiveColor: global_constants.BORDER_COLOR.primary),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: false,
          controller: otpTextFieldController,
          keyboardType: TextInputType.number,
          onChanged: (value) {},
        ),
      ),
    );
  }

  signUpAttempt() async {
    if (otpFormKey.currentState!.validate()) {
      if (otpTextFieldController.text.length < 6) {
        setState(() {
          otpError = true;
        });
      } else {
        try {
          setState(() {
            otpError = false;
          });

          PhoneAuthCredential credentials = PhoneAuthProvider.credential(
              verificationId: super.widget.id,
              smsCode: otpTextFieldController.text);

          final signInWithCredentialsResponse =
              await authInstance.signInWithCredential(credentials);

          if (signInWithCredentialsResponse.user != null) {
            setState(() {
              otpError = false;
            });

            //TODO:__________Push User to Redux______________

            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const UpdateProfileScreen();
            }));
          }
        } on FirebaseAuthException catch (e) {
          setState(() {
            otpError = true;
          });
        }
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                header,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          local_strings.HEADINGS.heading,
                          style: local_constants.TEXT_STYLES.heading,
                        ),
                        const Text(
                          local_strings.HEADINGS.phone_number,
                          style: local_constants.TEXT_STYLES.phone_number,
                        ),
                        const SizedBox(height: 40.0),
                        SizedBox(
                          width: device_width > 800
                              ? device_width * 0.25
                              : device_width * 0.8,
                          child: otpForm(),
                        ),
                        otpError
                            ? const Text(
                                local_strings.ERRORS.incorrect_otp,
                                style:
                                    local_constants.ERROR_STYLES.default_style,
                              )
                            : const Text(
                                local_strings.LINKS.resend_otp,
                                style: local_constants.LINK_STYLES.resend_otp,
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
                    if (otpFormKey.currentState!.validate()) {
                      signUpAttempt();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
