import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tagesplan/ui/shared/sidebar_button.dart';
import 'package:tagesplan/utils/drawer_painter.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Offset _offset = const Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];

  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance?.addPostFrameCallback(getPosition);
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.deepOrange,
        systemNavigationBarIconBrightness: Brightness.light,
        /*statusBarColor: [Color.fromRGBO(255, 65, 108, 1.0),
            Color.fromRGBO(255, 75, 73, 1.0)],
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light*/
      ));
    }
    super.initState();
  }

  getPosition(duration) {
    RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      double start = position.dy - 20;
      double contLimit = position.dy + renderBox.size.height - 20;
      double step = (contLimit - start) / 2;
      limits = [];
      for (double x = start; x <= contLimit; x += step) {
        limits.add(x);
      }
      setState(() {
        limits = limits;
      });
    }
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      top: false,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (isMenuOpen == true) {
            setState(() {
              _offset = details.localPosition;
            });
          }
        },
        onHorizontalDragUpdate: (details) {
          if (details.delta.distanceSquared > 1.5 &&
              details.localPosition.dx < mediaQuery.width * 0.25 &&
              isMenuOpen == false) {
            setState(() {
              isMenuOpen = true;
            });
          }
          if (details.delta.distanceSquared > 1.5 &&
                  details.localPosition.dx > mediaQuery.width * 0.75 ||
              details.localPosition.dy > mediaQuery.height * 0.80 &&
                  isMenuOpen == true) {
            setState(() {
              isMenuOpen = false;
              _offset = const Offset(0, 0);
            });
          }
        },
        onVerticalDragEnd: (details) {
          setState(() {
            _offset = const Offset(0, 0);
          });
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 65, 108, 1.0),
              Color.fromRGBO(255, 75, 73, 1.0)
            ])),
            width: mediaQuery.width,
            child: Stack(
              children: <Widget>[
                Center(
                  child: MaterialButton(
                    color: Colors.white,
                    child: const Text(
                      'Hello World',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ),
                AnimatedPositioned(
                    duration: Duration(milliseconds: 1200),
                    left: isMenuOpen ? 0 : -sidebarSize + 10,
                    top: 0,
                    curve: Curves.elasticOut,
                    child: SizedBox(
                      width: sidebarSize,
                      child: Stack(
                        children: <Widget>[
                          CustomPaint(
                            size: Size(sidebarSize, mediaQuery.height),
                            painter: DrawerPainter(offset: _offset),
                          ),
                          SizedBox(
                            height: mediaQuery.height,
                            width: sidebarSize,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(
                                  height: mediaQuery.height * 0.25,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/Quickborn_Logo.png',
                                          width: sidebarSize / 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Quickborn AK',
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  key: globalKey,
                                  width: double.infinity,
                                  height: menuContainerHeight,
                                  child: Column(
                                    children: <Widget>[
                                      SidebarButton(
                                          text: 'Tagesplan',
                                          iconData: Icons.view_day_rounded,
                                          textSize: getSize(0),
                                          height: (menuContainerHeight) / 2),
                                      SidebarButton(
                                          text: 'Login',
                                          iconData: Icons.login_rounded,
                                          textSize: getSize(1),
                                          height: (menuContainerHeight) / 2)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
