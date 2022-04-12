part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class TimeTablePageClicked extends NavigationEvent {}

class LoginPageClicked extends NavigationEvent {}

class SettingsPageClicked extends NavigationEvent {}
