import 'package:tagesplan/models/event.dart';

class EventsResponse {
  String? ;
  List<Event>? events;
  EventsResponse({
    this.response,
    this.id,
    this.name,
  });
  EventsResponse.fromJson(Map<String, dynamic> json) {
    events = json['powerstats'] != null
        ? Powerstats.fromJson(json['powerstats'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['response'] = response;
    data['id'] = id;
    data['name'] = name;
    if (powerstats != null) {
      data['powerstats'] = powerstats!.toJson();
    }
    if (biography != null) {
      data['biography'] = biography!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
