import 'package:tagesplan/app/app.locator.dart';
import 'package:tagesplan/models/events_response.dart';
import 'package:tagesplan/utils/api_constant.dart';

import 'api_service.dart';

class EventService {
  final _apiService = locator<ApiService>();

  Future<EventsResponse?> getEvents() async {
    try {
      final response = await _apiService.get(ApiConstants.getEvents);
      if (response != null) {
        final eventsData = EventsResponse.fromJson(response);
        return eventsData;
      }
    } catch (e) {
      rethrow;
    }
  }
}
