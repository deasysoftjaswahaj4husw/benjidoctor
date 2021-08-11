import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:benjidoctor/screens/dashboard.dart';
import 'package:benjidoctor/screens/profile.dart';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

import 'package:benjidoctor/resources/clients/strings.dart' as local_strings;
import 'package:benjidoctor/resources/clients/constants.dart'
    as local_constants;

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final addClientFormKey = GlobalKey<FormState>();

  final nameFieldController = TextEditingController();
  final phoneFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final diagnosisFieldController = TextEditingController();

  List<String> workplaces = [
    'All Workplaces',
    'Workplace 1',
    'Workplace 2',
    'Workplace 3'
  ];

  String selectedWorkplace = 'All Workplaces';

  workPlaceDropDown() {
    //TODO:__________Load Workspaces dynamically

    return Container(
      padding: global_constants.PADDING.p2,
      decoration: BoxDecoration(
        border: Border.all(
          color: global_constants.BORDER_COLOR.primary,
        ),
      ),
      child: DropdownButton<String>(
        icon: const Icon(MaterialIcons.keyboard_arrow_down),
        value: selectedWorkplace,
        isExpanded: true,
        items: workplaces.map((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(
              val,
              style: local_constants.LABEL_STYLES.default_style,
            ),
          );
        }).toList(),
        hint: const Text("All Workplaces"),
        onChanged: (newVal) {
          setState(() {
            selectedWorkplace = newVal!;
          });
        },
      ),
    );
  }

  addClientForm() {
    return Padding(
      padding: global_constants.PADDING.p4,
      child: Form(
        key: addClientFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: local_constants.TEXTFORMFIELD_STYLES.name,
                controller: nameFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: local_constants.TEXTFORMFIELD_STYLES.phone,
                controller: phoneFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: local_constants.TEXTFORMFIELD_STYLES.email,
                controller: emailFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: local_constants.TEXTFORMFIELD_STYLES.diagnosis,
                controller: diagnosisFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Diagnosis/Concern is required';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: workPlaceDropDown(),
            ),
          ],
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      leadingWidth: 0,
      title: const Text(
        local_strings.HEADINGS.my_clients,
        style: local_constants.TEXT_STYLES.screen_name,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          tooltip: 'Search',
          onPressed: () {
            // TODO:__________Add Search Feature
          },
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        child: Container(
          color: global_constants.BORDER_COLOR.appbar_bottom_border,
          height: 1.0,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
    );
  }

  noClients() {
    return const Center(
      child: Text(
        local_strings.HEADINGS.no_clients,
        style: local_constants.TEXT_STYLES.heading,
        textAlign: global_constants.TEXT_ALIGN.center,
      ),
    );
  }

  addClientDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            local_strings.HEADINGS.add_client,
            style: local_constants.TEXT_STYLES.heading,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  local_strings.SUB_HEADINGS.add_client,
                  style: local_constants
                      .TEXT_STYLES.add_clients_alert_box_subheading,
                ),
                addClientForm(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Back',
                style: local_constants.LINK_STYLES.default_style,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: global_constants.BG_COLOR.default_color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: const Text(
                  'Add to Roster',
                  style: local_constants.LINK_STYLES.default_style,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      onTap: (int index) {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const DashboardScreen();
          }));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const ClientsScreen();
          }));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const ProfileScreen();
          }));
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            MaterialCommunityIcons.calendar_multiple_check,
          ),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.chatbubbles_sharp,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.ios_person_circle_sharp,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: global_constants.BOTTOM_NAVBAR.active_icon_color,
      unselectedItemColor: global_constants.BOTTOM_NAVBAR.inactive_icon_color,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 10,
    );
  }

  addClients() {
    return ElevatedButton(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              global_constants.IMAGE.add,
              color: global_constants.TEXT_COLOR.secondary,
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text(
              local_strings.LABELS.add_client,
              style: local_constants.TEXT_STYLES.add_clients,
              textAlign: global_constants.TEXT_ALIGN.right,
            ),
          ],
        ),
      ),
      style: local_constants.BUTTON_STYLES.default_style,
      onPressed: () => addClientDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: global_constants.PADDING.p4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    noClients(),
                    const SizedBox(height: 40.0),
                    addClients(),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: appBar(),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }
}
