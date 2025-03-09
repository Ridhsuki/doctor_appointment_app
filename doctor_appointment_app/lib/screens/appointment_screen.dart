import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

// enum for appointment status
enum FilterStatus { upComing, complete, cancel }

class _AppointmentScreenState extends State<AppointmentScreen> {
  FilterStatus status = FilterStatus.upComing; // Initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Doctor Tenma",
      "doctor_profile": "assets/profile3.jpg",
      "category": "Dental",
      "status": FilterStatus.upComing,
    },
    {
      "doctor_name": "Doctor Tsunade",
      "doctor_profile": "assets/profile2.jpg",
      "category": "Cardiology",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Nia Ayu",
      "doctor_profile": "assets/profile1.jpg",
      "category": "Respiration",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Rika",
      "doctor_profile": "assets/profile1.jpg",
      "category": "General",
      "status": FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Filter tabs
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (filterStatus == FilterStatus.upComing) {
                                    status = FilterStatus.upComing;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  } else if (filterStatus ==
                                      FilterStatus.cancel) {
                                    status = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                },
                              );
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(schedule['doctor_profile']),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctor_name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    schedule['category'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          //schedule card
                          ScheduleCard(),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel',
                                    style:
                                        TextStyle(color: Config.primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Schedule Widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: Config.primaryColor,
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            'Monday, 11/28/2025',
            style: TextStyle(color: Config.primaryColor),
          ),
          SizedBox(width: 20),
          Icon(
            Icons.access_alarm_outlined,
            color: Config.primaryColor,
            size: 17,
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              '2:00 PM',
              style: TextStyle(color: Config.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
