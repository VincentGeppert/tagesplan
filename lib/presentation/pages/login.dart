import 'package:flutter/material.dart';
import 'package:tagesplan/logic/bloc/navigation_bloc.dart';

class Login extends StatelessWidget with NavigationState {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(255, 65, 108, 1.0),
          Color.fromRGBO(255, 75, 73, 1.0)
        ])),
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text("wdwada")));
  }
}
