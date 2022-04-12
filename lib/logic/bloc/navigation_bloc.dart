import 'package:bloc/bloc.dart';
import 'package:tagesplan/presentation/pages/login.dart';
import 'package:tagesplan/presentation/pages/settings.dart';
import 'package:tagesplan/presentation/pages/time_table.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(TimeTable()) {
    on<TimeTablePageClicked>((event, emit) => emit(TimeTable()));
    on<LoginPageClicked>((event, emit) => emit(Login()));
    on<SettingsPageClicked>((event, emit) => emit(Settings()));
  }
  // @override
  // NavigationState get initialState => TimeTable();

  // @override
  // Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
  //   // if (event is TimeTablePageClicked) {
  //   //   yield TimeTable();
  //   // } else if (event is LoginPageClicked) {
  //   //   yield Login();
  //   // } else if (event is SettingsPageClicked) {
  //   //   yield Settings();
  //   // }

  //   switch (event) {
  //     case NavigationEvent.TimeTablePageClicked:
  //       yield TimeTable();
  //       break;
  //     case NavigationEvent.LoginPageClicked:
  //       yield Login();
  //       break;
  //     case NavigationEvent.SettingsPageClicked:
  //       yield Settings();
  //       break;
  //     default:
  //   }
  // }
}
