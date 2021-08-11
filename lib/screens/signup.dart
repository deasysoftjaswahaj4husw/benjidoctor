import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/signup/strings.dart' as local_strings;
import 'package:benjidoctor/resources/signup/constants.dart' as local_constants;

import 'package:benjidoctor/screens/login.dart';
import 'package:benjidoctor/screens/signup_request.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: global_constants.PADDING.p4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(global_constants.IMAGE.app_logo),
              Column(
                children: [
                  const Text(
                    local_strings.HEADINGS.about,
                    style: local_constants.TEXT_STYLES.about,
                    textAlign: global_constants.TEXT_ALIGN.center,
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    local_strings.SUB_HEADINGS.instruction,
                    style: local_constants.TEXT_STYLES.instruction,
                    textAlign: global_constants.TEXT_ALIGN.center,
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    local_strings.SUB_HEADINGS.signup,
                    style: local_constants.TEXT_STYLES.signup,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SignUpRequestScreen();
                      }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(global_constants.IMAGE.phone),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            local_strings.LABELS.phone_number,
                            style: local_constants.TEXT_STYLES.phone_number,
                            textAlign: global_constants.TEXT_ALIGN.right,
                          ),
                        ],
                      ),
                    ),
                    style: local_constants.BUTTON_STYLES.phone_number,
                  ),
                ],
              ),
              const SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: global_constants.PADDING.py4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      local_strings.SUB_HEADINGS.already_have_an_account,
                      style:
                          local_constants.TEXT_STYLES.already_have_an_account,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: const Text(
                        local_strings.LINKS.log_in,
                        style: local_constants.TEXT_STYLES.log_in,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const LoginScreen();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
