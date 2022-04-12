import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tagesplan/services/api_service.dart';
import 'package:tagesplan/services/connectivity_service.dart';
import 'package:tagesplan/services/event_service.dart';
import 'package:tagesplan/ui/views/timeTable/time_table.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: TimeTable, initial: true),
  ],
  dependencies: [
    Singleton(classType: SnackbarService),
    Singleton(classType: ConnectivityService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: EventService)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
