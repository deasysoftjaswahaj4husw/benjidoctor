import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/login/strings.dart' as local_strings;
import 'package:benjidoctor/resources/login/constants.dart' as local_constants;

import 'package:benjidoctor/screens/signup.dart';
import 'package:benjidoctor/screens/login_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      local_strings.SUB_HEADINGS.log_in,
                      style: local_constants.TEXT_STYLES.log_in,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const LoginRequestScreen();
                        }));
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
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
                        local_strings.SUB_HEADINGS.dont_have_an_account,
                        style: local_constants.TEXT_STYLES.dont_have_an_account,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        child: const Text(
                          local_strings.LINKS.signup,
                          style: local_constants.TEXT_STYLES.signup,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const SignUpScreen();
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
      ),
    );
  }
}
