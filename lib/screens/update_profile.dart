import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/update_profile/strings.dart'
    as local_strings;
import 'package:benjidoctor/resources/update_profile/constants.dart'
    as local_constants;

import 'package:benjidoctor/screens/update_practice.dart';

abstract class PROFESSIONS {
  static const psychiatrist = 'psychiatrist';
  static const clinical_psychologist = 'clinical psychologist';
  static const counselling_psychologist = 'counselling psychologist';
}

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final updateProfileFormKey = GlobalKey<FormState>();

  final usernameFieldController = TextEditingController();
  final nameFieldController = TextEditingController();
  final phoneFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final qualificationFieldController = TextEditingController();
  final registrationNumberFieldController = TextEditingController();
  final locationFieldController = TextEditingController();

  bool is_psychiatrist = false;
  bool is_clinical_psychologist = false;
  bool is_counselling_psychologist = false;

  updateProfileForm() {
    return Padding(
      padding: global_constants.PADDING.p4,
      child: Form(
        key: updateProfileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.add_username,
              controller: usernameFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.name,
              controller: nameFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.xxxx,
              controller: phoneFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.email,
              controller: emailFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: global_constants.PADDING.p2,
              child: Text(
                local_strings.PARAGRAPHS.im_a,
                style: local_constants.LABEL_STYLES.default_style,
              ),
            ),
            LabeledCheckbox(
              label: local_strings.LABELS.psychiatrist,
              padding: global_constants.PADDING.p0,
              value: is_psychiatrist,
              onChanged: (bool newValue) {
                setState(() {
                  is_psychiatrist = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: local_strings.LABELS.clinical_psychologist,
              padding: global_constants.PADDING.p0,
              value: is_clinical_psychologist,
              onChanged: (bool newValue) {
                setState(() {
                  is_clinical_psychologist = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: local_strings.LABELS.counselling_psychologist,
              padding: global_constants.PADDING.p0,
              value: is_counselling_psychologist,
              onChanged: (bool newValue) {
                setState(() {
                  is_counselling_psychologist = newValue;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.qualification,
              controller: qualificationFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Qualification is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration:
                  local_constants.TEXTFORMFIELD_STYLES.registration_number,
              controller: registrationNumberFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Registration Number is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.location,
              controller: locationFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Location is required';
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  updateProfile() async {
    if (updateProfileFormKey.currentState!.validate()) {
      //TODO:_____________ Refactor into services

      String url =
          'https://benji-backend.herokuapp.com/api/users/update-profile';

      Map<String, String> headers = {
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Bearer ",
      };

      String profession;

      if (is_psychiatrist) {
        profession = PROFESSIONS.psychiatrist;
      } else if (is_clinical_psychologist) {
        profession = PROFESSIONS.clinical_psychologist;
      } else {
        profession = PROFESSIONS.counselling_psychologist;
      }

      String data = jsonEncode({
        'username': usernameFieldController.text,
        'name': nameFieldController.text,
        'phone': phoneFieldController.text,
        'email': emailFieldController.text,
        'profession': profession,
        'qualification': qualificationFieldController.text,
        'registration_number': registrationNumberFieldController.text,
        'location': locationFieldController.text,
      });

      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: data);

      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const UpdatePracticeScreen();
        }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final device_height = MediaQuery.of(context).size.height;
    final device_width = MediaQuery.of(context).size.width;

    Widget progress = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          child: const Center(
            child:
                Text('1', style: local_constants.TEXT_STYLES.timeline_bubble),
          ),
          decoration: const BoxDecoration(
            color: local_constants.BG_COLOR.timeline_bubble_active,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: device_width > 800 ? device_width * 0.2 : device_width * 0.5,
          child: const Divider(
            color: local_constants.BG_COLOR.timeline_bubble_inactive,
            thickness: 5.0,
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: const Center(
            child:
                Text('2', style: local_constants.TEXT_STYLES.timeline_bubble),
          ),
          decoration: const BoxDecoration(
            color: local_constants.BG_COLOR.timeline_bubble_inactive,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: global_constants.PADDING.p4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40.0),
                  progress,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 40.0),
                          const SizedBox(height: 80.0),
                          const Text(local_strings.HEADINGS.heading,
                              style: local_constants.TEXT_STYLES.heading),
                          const SizedBox(height: 40.0),
                          SizedBox(
                            width: device_width > 800
                                ? device_width * 0.4
                                : device_width * 0.8,
                            child: updateProfileForm(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          local_strings.LINKS.next,
                          style: local_constants.LINK_STYLES.default_style,
                        ),
                        Image.asset(global_constants.IMAGE.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePracticeScreen()),
                      );

                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
            Text(label, style: local_constants.LABEL_STYLES.default_style),
          ],
        ),
      ),
    );
  }
}
