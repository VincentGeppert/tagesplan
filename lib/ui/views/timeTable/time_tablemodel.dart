import 'package:stacked/stacked.dart';
import 'package:tagesplan/app/app.locator.dart';
import 'package:tagesplan/app/app.logger.dart';
import 'package:tagesplan/models/events_response.dart';
import 'package:tagesplan/services/connectivity_service.dart';
import 'package:tagesplan/services/event_service.dart';
import 'package:tagesplan/utils/enums.dart';

class TimeTableModel extends StreamViewModel {
  final _connectivityService = locator<ConnectivityService>();
  final _sidebarService = locator<SidebarService>();
  final _eventsService = locator<EventService>();
  final log = getLogger('TimeTableModel');

  //7
  EventsResponse? EventsDetail;
  // 3
  bool connectionStatus = false;
  bool hasCalled = false;
  bool hasShownSnackbar = false;

  // 1
  Stream<bool> checkConnectivity() async* {
    yield await _connectivityService.checkInternetConnection();
  }

  // 2
  @override
  Stream get stream => checkConnectivity();

  // 4
  bool get status {
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
      // 5 & 6
      if (hasCalled == false) getCharacters();
    });
    return connectionStatus;
  }

  Future<void> getCharacters() async {
    if (connectionStatus == true) {
      try {
        detail = await runBusyFuture(
          _eventsService.getEvents(),
          throwException: true,
        );
        // 6b:  We set the 'hasCalled' boolean to true only if the call is successful, which then prevents the app from re-fetching the data
        hasCalled = true;
        notifyListeners();
      } on SocketException catch (e) {
        hasCalled = true;
        notifyListeners();
        // 8
        _sidebarService.showCustomSnackBar(
          variant: SidebarType.negative,
          message: e.toString(),
        );
      } on Exception catch (e) {
        hasCalled = true;
        notifyListeners();
        // 8
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.negative,
          message: e.toString(),
        );
      }
    } else {
      log.e('Internet Connectivity Error');
      if (hasShownSnackbar == false) {
        // 8
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.negative,
          message: 'Error: Internet Connection is weak or disconnected',
          duration: const Duration(seconds: 5),
        );
        hasShownSnackbar = true;
        notifyListeners();
      }
    }
  }
}
