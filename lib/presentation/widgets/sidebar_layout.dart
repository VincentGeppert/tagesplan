import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tagesplan/logic/bloc/navigation_bloc.dart';
import 'package:tagesplan/presentation/widgets/sidebar.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, navigationState) {
            return navigationState as Widget;
          }),
          Sidebar()
        ],
      ),
    );
  }
}
