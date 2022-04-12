// @dart=2.9
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tagesplan/logic/bloc/navigation_bloc.dart';
import 'package:tagesplan/logic/bloc/network_bloc.dart';
import 'package:tagesplan/logic/cubit/internet_cubit.dart';
import 'package:tagesplan/presentation/animations/drawer_painter.dart';
import 'package:tagesplan/presentation/pages/time_table.dart';
import 'package:tagesplan/presentation/widgets/sidebar_button.dart';
import 'package:rxdart/rxdart.dart';

class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 1100);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final menuContainerHeight = screenHeight / 2;
    Color color = Colors.red;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return BlocConsumer<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state is NetworkSuccess) {
              color = Colors.blue;
            } else {
              color = Colors.red;
            }
          },
          builder: (context, state) => AnimatedPositioned(
              duration: _animationDuration,
              curve: Curves.elasticOut,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? -100 : -screenWidth - 100,
              right: isSideBarOpenedAsync.data ? 50 : screenWidth - 45,
              child: Row(children: <Widget>[
                Container(
                  width: 100,
                  color: const Color(0xFF262AAA),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: color,
                    child: Column(children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Image.asset(
                        'assets/Quickborn_Logo.png',
                        width: screenWidth / 3.5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Quickborn AK',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.5),
                        indent: 32,
                        endIndent: 32,
                      ),
                      SidebarButton(
                          title: 'Tagesplan',
                          icon: Icons.view_day_rounded,
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(TimeTablePageClicked());
                          }),
                      SidebarButton(
                          title: 'Login',
                          icon: Icons.login_rounded,
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(LoginPageClicked());
                          }),
                    ]),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: const Color(0xFF262AAA),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: const Color(0xFF1BB5FD),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
//     return AnimatedPositioned(
//         duration: const Duration(milliseconds: 1200),
//         left: isMenuOpen ? 0 : -sidebarSize + 40,
//         top: 0,
//         curve: Curves.elasticOut,
//         child: SizedBox(
//             width: sidebarSize,
//             child: GestureDetector(
//               onPanUpdate: (details) {
//                 if (details.localPosition.dx <= sidebarSize) {
//                   setState(() {
//                     _offset = details.localPosition;
//                   });
//                 }

//                 if (details.localPosition.dx > sidebarSize - 20 &&
//                     details.delta.distanceSquared > 2) {
//                   setState(() {
//                     isMenuOpen = true;
//                   });
//                 }
//               },
//               onPanEnd: (details) {
//                 setState(() {
//                   _offset = Offset(0, 0);
//                 });
//               },
//               child: Stack(
//                 children: <Widget>[
//                   CustomPaint(
//                     size: Size(sidebarSize, mediaQuery.height),
//                     painter: DrawerPainter(offset: _offset),
//                   ),
//                   SizedBox(
//                     height: mediaQuery.height,
//                     width: sidebarSize,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: <Widget>[
//                         SizedBox(
//                           height: mediaQuery.height * 0.25,
//                           child: Center(
//                             child: Column(
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/Quickborn_Logo.png',
//                                   width: sidebarSize / 2,
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'Quickborn AK',
//                                   style: TextStyle(
//                                       color: Colors.black45, fontSize: 25),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const Divider(
//                           thickness: 1,
//                         ),
//                         SizedBox(
//                           key: globalKey,
//                           width: double.infinity,
//                           height: menuContainerHeight,
//                           child: Column(
//                             children: <Widget>[
//                               SidebarButton(
//                                   text: 'Tagesplan',
//                                   iconData: Icons.view_day_rounded,
//                                   textSize: getSize(0),
//                                   height: (menuContainerHeight) / 2,
//                                   event: TimeTablePageClicked()),
//                               SidebarButton(
//                                 text: 'Login',
//                                 iconData: Icons.login_rounded,
//                                 textSize: getSize(1),
//                                 height: (menuContainerHeight) / 2,
//                                 event: LoginPageClicked(),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   AnimatedPositioned(
//                     duration: Duration(milliseconds: 100),
//                     right: (isMenuOpen) ? 10 : sidebarSize,
//                     bottom: 30,
//                     child: IconButton(
//                       enableFeedback: true,
//                       icon: const Icon(
//                         Icons.keyboard_backspace,
//                         color: Colors.black45,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           isMenuOpen = false;
//                         });
//                       },
//                     ),
//                   ),
//                   Align(
//                     alignment: const Alignment(0, -0.9),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           if (isMenuOpen) {
//                             isMenuOpen = false;
//                           } else {
//                             isMenuOpen = true;
//                           }
//                         });
//                       },
//                       child: ClipPath(
//                         clipper: CustomMenuClipper(),
//                         child: Container(
//                           width: 35,
//                           height: 110,
//                           color: Color(0xFF262AAA),
//                           alignment: Alignment.centerLeft,
//                           child: AnimatedIcon(
//                             progress: _animationController.view,
//                             icon: AnimatedIcons.menu_close,
//                             color: Color(0xFF1BB5FD),
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )));
//   }
// }

// class CustomMenuClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.white;

//     final width = size.width;
//     final height = size.height;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 8, 10, 16);
//     path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
//     path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
//     path.quadraticBezierTo(0, height - 8, 0, height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }




              // onVerticalDragUpdate: (details) {
              //   if (isMenuOpen == true) {
              //     setState(() {
              //       _offset = details.localPosition;
              //     });
              //   }
              // },
              // onHorizontalDragUpdate: (details) {
              //   if (details.delta.distanceSquared > 1.5 &&
              //       details.localPosition.dx < mediaQuery.width * 0.25 &&
              //       isMenuOpen == false) {
              //     setState(() {
              //       isMenuOpen = true;
              //     });
              //   }
              //   if (details.delta.distanceSquared > 1.5 &&
              //           details.localPosition.dx >
              //               mediaQuery.width * 0.65 ||
              //       details.localPosition.dy > mediaQuery.height * 0.80 &&
              //           isMenuOpen == true) {
              //     setState(() {
              //       isMenuOpen = false;
              //       _offset = const Offset(0, 0);
              //     });
              //   }
              // },
              // onVerticalDragEnd: (details) {
              //   setState(() {
              //     _offset = const Offset(0, 0);
              //   });
              // },
