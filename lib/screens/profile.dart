import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:expandable/expandable.dart';

import 'package:benjidoctor/screens/clients.dart';
import 'package:benjidoctor/screens/dashboard.dart';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

import 'package:benjidoctor/resources/profile/strings.dart' as local_strings;
import 'package:benjidoctor/resources/profile/constants.dart'
    as local_constants;

import 'package:benjidoctor/models/payment.dart';
import 'package:benjidoctor/models/practice.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO:______________API Call for workplaces
  List<String> workplaces = ['Workplace 1', 'Workplace 2', 'Workplace 3'];

  List<Payment> payments = [
    Payment('name 1', '123456789', '999999999'),
    Payment('name 2', '123333333', '111111111'),
    Payment('name 3', '099999922', '555555555')
  ];

  List<Practice> practices = [
    Practice('Workplace 1', {'day': 'Mon', 'from': '11', 'to': '12'}),
    Practice('Workplace 2', {'day': 'Mon', 'from': '11', 'to': '12'}),
    Practice('Workplace 3', {'day': 'Mon', 'from': '11', 'to': '12'}),
  ];

  logoutComponent() {
    return InkWell(
      child: Container(
        padding: global_constants.PADDING.p4,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Logout',
              style: local_constants.TEXT_STYLES.heading_default,
            ),
            Icon(
              AntDesign.rightcircle,
              size: 30,
              color: local_constants.ICON_COLOR.right_arrow,
            ),
          ],
        ),
      ),
      onTap: () {
        //TODO:___________Implement Logout Feature
      },
    );
  }

  bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 2,
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

  @override
  Widget build(BuildContext context) {
    final device_height = MediaQuery.of(context).size.height;
    final device_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: global_constants.PADDING.p4,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Anjali Mehta',
                          style: local_constants.TEXT_STYLES.heading_default,
                        ),
                        Icon(
                          SimpleLineIcons.pencil,
                          size: 20,
                          color: local_constants.ICON_COLOR.default_color,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Clinical Psychologist',
                      style: local_constants.TEXT_STYLES.subheading_default,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'M.Phil Clinical Psychology',
                      style: local_constants.TEXT_STYLES.subheading_default,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Workplaces',
                          style: local_constants.TEXT_STYLES.heading_default,
                        ),
                        Icon(
                          SimpleLineIcons.pencil,
                          size: 20,
                          color: local_constants.ICON_COLOR.default_color,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: device_height / 1.7,
                      child: ListView.builder(
                        itemCount: practices.length,
                        itemBuilder: (context, index) {
                          return CollapsibleContainer(
                            workplace_name: workplaces[index],
                            practice_details: practices[index],
                            payment_details: payments[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    logoutComponent(),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }
}

class CollapsibleContainer extends StatelessWidget {
  final String workplace_name;
  final Practice practice_details;
  final Payment payment_details;

  const CollapsibleContainer(
      {Key? key,
      required this.workplace_name,
      required this.practice_details,
      required this.payment_details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: global_constants.PADDING.py2,
      padding: global_constants.PADDING.p2,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpandablePanel(
        header: Padding(
          padding: global_constants.PADDING.p3,
          child: Text(
            workplace_name,
            style: local_constants.TEXT_STYLES.collapsible_container_heading,
          ),
        ),
        collapsed: const Text(
          '',
        ),
        expanded: Padding(
          padding: global_constants.PADDING.p3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                practice_details.workplace_name,
                style: local_constants
                    .TEXT_STYLES.collapsible_container_subheading,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    practice_details.working_hours['day'],
                    style: local_constants
                        .TEXT_STYLES.collapsible_container_content,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        practice_details.working_hours['from'],
                        style: local_constants
                            .TEXT_STYLES.collapsible_container_content,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        local_strings.PARAGRAPHS.to,
                        style: local_constants
                            .TEXT_STYLES.collapsible_container_content,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        practice_details.working_hours['to'],
                        style: local_constants
                            .TEXT_STYLES.collapsible_container_content,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
