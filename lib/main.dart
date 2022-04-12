import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tagesplan/app/app.router.dart';
import 'package:tagesplan/ui/shared/setup_sidebar_ui.dart';
import 'app/app.locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await setupSidebarUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connectivity',
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}





















/*


// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_customizable_time_plan/splash_screen.dart';
import 'package:time_planner/time_planner.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tagesplan',
    initialRoute: '/',
    routes: {
      '/': (context) => const Tagesplan(),
      '/settings': (context) => Settings(
            title: '',
          )
    },
  ));
}

class Tagesplan extends StatelessWidget {
  const Tagesplan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Row(
          children: [
            DataTable(dataRowHeight: 40, columns: const <DataColumn>[
              DataColumn(label: Text(''))
            ], rows: <DataRow>[
              const DataRow(cells: <DataCell>[DataCell(Text('7:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('8:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('9:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('10:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('11:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('12:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('13:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('14:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('15:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('16:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('17:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('18:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('19:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('20:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('21:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('22:00'))]),
              const DataRow(cells: <DataCell>[DataCell(Text('23:00'))]),
            ]),
            Container(
                width: 300,
                child: SingleChildScrollView(
                    /*minScale: 1.0,
            maxScale: 2.0,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            constrained: false,*/
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(keepScrollOffset: true),
                    child: DataTable(columns: const <DataColumn>[
                      DataColumn(label: Text('28.12.')),
                      DataColumn(label: Text('29.12.')),
                      DataColumn(label: Text('30.12.')),
                      DataColumn(label: Text('31.12.')),
                      DataColumn(label: Text('01.01.')),
                      DataColumn(label: Text('02.01.')),
                      DataColumn(label: Text('03.01.')),
                      DataColumn(label: Text('04.01.'))
                    ], rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container())
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container()),
                        DataCell(Container())
                      ])
                      /*DataRow(cells: <DataCell>[
                    DataCell(Row(
                      children: <Widget>[
                        const Expanded(child: Text('8:00')),
                        const Expanded(child: Text('9:00'))
                      ],
                    ))
                  ])*/
                    ])))
          ],
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  List<TimePlannerTask> tasks = [];

  void _addObject(BuildContext context) {
    List<Color> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.cyan
    ];

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(
              day: Random().nextInt(10),
              hour: Random().nextInt(14) + 6,
              minutes: Random().nextInt(60)),
          minutesDuration: Random().nextInt(90) + 30,
          daysDuration: Random().nextInt(4) + 1,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You click on time planner object')));
          },
          child: Text(
            'this is a demo',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: const Text('Random task added to time planner!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: TimePlanner(
          startHour: 7,
          endHour: 23,
          headers: [
            const TimePlannerTitle(
              date: "7/20/2021",
              title: "tuesday",
            ),
            const TimePlannerTitle(
              date: "7/21/2021",
              title: "wednesday",
            ),
            const TimePlannerTitle(
              date: "7/22/2021",
              title: "thursday",
            ),
            const TimePlannerTitle(
              date: "7/23/2021",
              title: "friday",
            ),
            const TimePlannerTitle(
              date: "7/24/2021",
              title: "saturday",
            ),
            const TimePlannerTitle(
              date: "7/25/2021",
              title: "sunday",
            ),
            const TimePlannerTitle(
              date: "7/26/2021",
              title: "monday",
            ),
            const TimePlannerTitle(
              date: "7/27/2021",
              title: "tuesday",
            ),
          ],
          tasks: tasks,
          style: TimePlannerStyle(showScrollBar: false, cellHeight: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addObject(context),
        tooltip: 'Add random task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/