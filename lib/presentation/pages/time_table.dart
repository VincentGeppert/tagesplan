// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tagesplan/logic/bloc/navigation_bloc.dart';
import 'package:time_planner/time_planner.dart';

class TimeTable extends StatefulWidget with NavigationState {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

// https://cloud.schiller-lan.party/s/fyZTABJSRDTSDC8/download/dates.json

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(255, 65, 108, 1.0),
          Color.fromRGBO(255, 75, 73, 1.0)
        ])),
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Center(
              child: TimePlanner(
            endHour: 23,
            headers: [
              TimePlannerTitle(title: "monday"),
              TimePlannerTitle(title: "monday1"),
              TimePlannerTitle(title: "monday2"),
              TimePlannerTitle(title: "monday3"),
              TimePlannerTitle(title: "monday4"),
              TimePlannerTitle(title: "monday5"),
            ],
            startHour: 7,
          )),
        ));
  }
}
