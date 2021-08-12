import 'package:benjidoctor/screens/clients.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:benjidoctor/resources/globals/strings.dart' as global_strings;
import 'package:benjidoctor/resources/globals/constants.dart'
as global_constants;

import 'package:benjidoctor/resources/update_practice/strings.dart'
as local_strings;
import 'package:benjidoctor/resources/update_practice/constants.dart'
as local_constants;

abstract class DAYS {
  static const mon = 'mon';
  static const tues = 'tues';
  static const wed = 'wed';
  static const thur = 'thur';
  static const fri = 'fri';
  static const sat = 'sat';
  static const sun = 'sun';
}
class UpdatePracticeScreen2 extends StatefulWidget {
  const UpdatePracticeScreen2({Key? key}) : super(key: key);

  @override
  _UpdatePracticeScreen2State createState() => _UpdatePracticeScreen2State();
}

class _UpdatePracticeScreen2State extends State<UpdatePracticeScreen2> {
  final updatePracticeFormKey = GlobalKey<FormState>();

  bool mon = false;
  bool tues = false;
  bool wed = false;
  bool thur = false;
  bool fri = false;
  bool sat = false;
  bool sun = false;

  bool showLoader = false;

  final mon_from_controller = TextEditingController();
  final mon_to_controller = TextEditingController();
  final tues_from_controller = TextEditingController();
  final tues_to_controller = TextEditingController();
  final wed_from_controller = TextEditingController();
  final wed_to_controller = TextEditingController();
  final thur_from_controller = TextEditingController();
  final thur_to_controller = TextEditingController();
  final fri_from_controller = TextEditingController();
  final fri_to_controller = TextEditingController();
  final sat_from_controller = TextEditingController();
  final sat_to_controller = TextEditingController();
  final sun_from_controller = TextEditingController();
  final sun_to_controller = TextEditingController();

  final name_of_workplace_controller = TextEditingController();
  final pan_number_controller = TextEditingController();
  final pan_holder_name_controller = TextEditingController();
  final billing_label_controller = TextEditingController();
  final ifsc_number_controller = TextEditingController();

  progress(device_width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          child: const Center(
            child: Text(
              local_strings.SUB_HEADINGS.one,
              style: local_constants.TEXT_STYLES.timeline_bubble,
            ),
          ),
          decoration: const BoxDecoration(
            color: local_constants.BG_COLOR.timeline_bubble_active,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: device_width > 800 ? device_width * 0.2 : device_width * 0.5,
          child: const Divider(
            color: local_constants.BG_COLOR.timeline_bubble_active,
            thickness: 5.0,
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: const Center(
            child: Text(
              local_strings.SUB_HEADINGS.two,
              style: local_constants.TEXT_STYLES.timeline_bubble,
            ),
          ),
          decoration: const BoxDecoration(
            color: local_constants.BG_COLOR.timeline_bubble_active,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  updatePractice() async {
    if (updatePracticeFormKey.currentState!.validate()) {
      //TODO:_____________ Refactor into services

      setState(() {
        showLoader = true;
      });

      String url = global_strings.SERVER_URL + 'http://104.248.233.75/api/practices';

      Map<String, String> headers = {
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Bearer ",
      };

      List working_hours = [];

      if (mon) {
        String from_hour = mon_from_controller.text;
        String to_hour = mon_to_controller.text;

        var working_hours_data = {
          'day': DAYS.mon,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }
      if (tues) {
        String from_hour = tues_from_controller.text;
        String to_hour = tues_to_controller.text;

        var working_hours_data = {
          'day': DAYS.tues,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }
      if (wed) {
        String from_hour = wed_from_controller.text;
        String to_hour = wed_to_controller.text;

        var working_hours_data = {
          'day': DAYS.wed,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }
      if (thur) {
        String from_hour = thur_from_controller.text;
        String to_hour = thur_to_controller.text;

        var working_hours_data = {
          'day': DAYS.thur,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }

      if (fri) {
        String from_hour = fri_from_controller.text;
        String to_hour = fri_to_controller.text;

        var working_hours_data = {
          'day': DAYS.fri,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }
      if (sat) {
        String from_hour = sat_from_controller.text;
        String to_hour = sat_to_controller.text;

        var working_hours_data = {
          'day': DAYS.sat,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }
      if (sun) {
        String from_hour = tues_from_controller.text;
        String to_hour = tues_to_controller.text;

        var working_hours_data = {
          'day': DAYS.sun,
          'from': from_hour,
          'to': to_hour
        };

        working_hours.add(working_hours_data);
      }

      String data = jsonEncode({
        'user_id': '610cee09a938c80015e1ef94',
        'workplace_name': name_of_workplace_controller.text,
        'pan_number': pan_number_controller.text,
        'pan_holder_name': pan_holder_name_controller.text,
        'billing_label': billing_label_controller.text,
        'ifsc_number': ifsc_number_controller.text,
        'working_hours': working_hours,
      });

      http.Response response =
      await http.post(Uri.parse(url), headers: headers, body: data);

      setState(() {
        showLoader = false;
      });

      // if (response.statusCode == 200) {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (BuildContext context) {
      //     return const UpdatePracticeScreen();
      //   }));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final device_height = MediaQuery.of(context).size.height;
    final device_width = MediaQuery.of(context).size.width;

    Widget working_hours_checkbox_group = Container(
      padding: global_constants.PADDING.p2,
      decoration: BoxDecoration(
        border: Border.all(color: global_constants.BORDER_COLOR.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: global_constants.PADDING.p1,
            child: Text(
              local_strings.LABELS.working_hours,
              style: local_constants.LABEL_STYLES.default_style,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.mon,
                padding: global_constants.PADDING.p0,
                value: mon,
                onChanged: (bool newValue) {
                  setState(() {
                    mon = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: mon_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: mon_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.tues,
                padding: global_constants.PADDING.p0,
                value: tues,
                onChanged: (bool newValue) {
                  setState(() {
                    tues = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: tues_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: tues_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.wed,
                padding: global_constants.PADDING.p0,
                value: wed,
                onChanged: (bool newValue) {
                  setState(() {
                    wed = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: wed_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: wed_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.thur,
                padding: global_constants.PADDING.p0,
                value: thur,
                onChanged: (bool newValue) {
                  setState(() {
                    thur = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: thur_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: thur_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.fri,
                padding: global_constants.PADDING.p0,
                value: fri,
                onChanged: (bool newValue) {
                  setState(() {
                    fri = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: fri_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: fri_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.sat,
                padding: global_constants.PADDING.p0,
                value: sat,
                onChanged: (bool newValue) {
                  setState(() {
                    sat = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: sat_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: sat_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCheckbox(
                label: local_strings.LABELS.sun,
                padding: global_constants.PADDING.p0,
                value: sun,
                onChanged: (bool newValue) {
                  setState(() {
                    sun = newValue;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: sun_from_controller,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    local_strings.LABELS.to,
                    style: local_constants.LABEL_STYLES.default_style,
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 50.0,
                    height: 20.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: global_constants.BORDER_COLOR.primary,
                          ),
                        ),
                      ),
                      controller: sun_to_controller,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    Widget updateProfileForm = Padding(
      padding: global_constants.PADDING.p4,
      child: Form(
        key: updatePracticeFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration:
              local_constants.TEXTFORMFIELD_STYLES.name_of_workplace,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name of Workplace is required';
                }

                return null;
              },
              controller: name_of_workplace_controller,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.pan_number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pan Number is required';
                }

                return null;
              },
              controller: pan_number_controller,
            ),
            const SizedBox(height: 20.0),
            working_hours_checkbox_group,
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.pan_holder_name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pan Holder Name is required';
                }

                return null;
              },
              controller: pan_holder_name_controller,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.billing_label,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Billing Label/Name is required';
                }

                return null;
              },
              controller: billing_label_controller,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: local_constants.TEXTFORMFIELD_STYLES.ifsc_number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'IFSC Number is required';
                }

                return null;
              },
              controller: ifsc_number_controller,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );

    addWorkPlace() {
      return GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: global_constants.PADDING.p2,
                decoration: BoxDecoration(
                  border:
                  Border.all(color: global_constants.BORDER_COLOR.primary),
                ),
                child: Image.asset(global_constants.IMAGE.add),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                local_strings.LINKS.add_workplace,
                style: local_constants.LABEL_STYLES.default_style,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePracticeScreen2()),
            );
          }
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: global_constants.PADDING.p4,
            child: !showLoader
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40.0),
                  progress(device_width),
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
                            child: updateProfileForm,
                          ),
                          addWorkPlace(),
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
                          style: local_constants.LINK_STYLES.next,
                        ),
                        Image.asset(global_constants.IMAGE.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientsScreen()),
                      );

                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            )
                : SizedBox(
              height: device_height / 1.3,
              child: const Center(
                child: CircularProgressIndicator(),
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
