import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:benjidoctor/screens/clients.dart';
import 'package:benjidoctor/screens/profile.dart';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

import 'package:benjidoctor/resources/dashboard/strings.dart' as local_strings;
import 'package:benjidoctor/resources/dashboard/constants.dart'
    as local_constants;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CalendarController calendarController = CalendarController();

  String dayFormat = 'EEE';
  String dateFormat = 'dd';

  List<String> workplaces = [
    'All Workplaces',
    'Workplace 1',
    'Workplace 2',
    'Workplace 3'
  ];

  String selectedWorkplace = 'All Workplaces';

  appBar() {
    return AppBar(
      leadingWidth: 0,
      title: const Text(
        local_strings.HEADINGS.screen_name,
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

  bottomNavBar() {
    return BottomNavigationBar(
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

  workPlaceDropDown() {
    //TODO:__________Load Workspaces dynamically

    return Container(
      padding: global_constants.PADDING.p2,
      height: 40.0,
      decoration: BoxDecoration(
        color: local_constants.BG_COLOR.dropdown_default.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        icon: const Icon(MaterialIcons.keyboard_arrow_down),
        value: selectedWorkplace,
        isExpanded: true,
        dropdownColor:
            local_constants.BG_COLOR.dropdown_default.withOpacity(0.8),
        items: workplaces.map((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(
              val,
              style: local_constants.TEXT_STYLES.dropdown_item,
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

  totalBillingCard(device_width) {
    return Container(
      width: device_width,
      color: local_constants.BG_COLOR.stats_card_default,
      padding: global_constants.PADDING.p3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                local_strings.HEADINGS.total_billing,
                style: local_constants.TEXT_STYLES.stats_heading,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                local_strings.SUB_HEADINGS.billing_this_month,
                style: local_constants.TEXT_STYLES.stats_subheadings,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                local_strings.SUB_HEADINGS.lifetime_billing,
                style: local_constants.TEXT_STYLES.stats_subheadings,
              ),
            ],
          ),
          const Icon(
            AntDesign.rightcircle,
            size: 30,
            color: local_constants.BG_COLOR.stats_card_right_arrow,
          ),
        ],
      ),
    );
  }

  pendingPaymentsCard(device_width) {
    return Container(
      width: device_width,
      color: local_constants.BG_COLOR.stats_card_default,
      padding: global_constants.PADDING.p3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                local_strings.HEADINGS.pending_payments,
                style: local_constants.TEXT_STYLES.stats_heading,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                local_strings.SUB_HEADINGS.payments_pending,
                style: local_constants.TEXT_STYLES.stats_subheadings,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                local_strings.SUB_HEADINGS.value_pending_payments,
                style: local_constants.TEXT_STYLES.stats_subheadings,
              ),
            ],
          ),
          const Icon(
            AntDesign.rightcircle,
            size: 30,
            color: local_constants.BG_COLOR.stats_card_right_arrow,
          ),
        ],
      ),
    );
  }

  calendarViewChanged(ViewChangedDetails viewChangedDetails) {
    if (calendarController.view == CalendarView.day) {
      SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
        if (dayFormat != 'EEEEE' || dateFormat != 'dd') {
          setState(() {
            dayFormat = 'EEEEE';
            dateFormat = 'dd';
          });
        } else {
          return;
        }
      });
    } else {
      SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
        if (dayFormat != 'EEE' || dateFormat != 'dd') {
          setState(() {
            dayFormat = 'EEE';
            dateFormat = 'dd';
          });
        } else {
          return;
        }
      });
    }
  }

  calendar() {
    return SfCalendar(
      backgroundColor: Colors.transparent,
      view: CalendarView.week,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.workWeek
      ],
      controller: calendarController,
      timeSlotViewSettings:
          TimeSlotViewSettings(dateFormat: dateFormat, dayFormat: dayFormat),
      onViewChanged: calendarViewChanged,
      showDatePickerButton: true,
      showCurrentTimeIndicator: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final device_height = MediaQuery.of(context).size.height;
    final device_width = MediaQuery.of(context).size.width;

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
                    workPlaceDropDown(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    totalBillingCard(device_width),
                    const SizedBox(
                      height: 20.0,
                    ),
                    pendingPaymentsCard(device_width),
                    const SizedBox(
                      height: 20.0,
                    ),
                    calendar(),
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
