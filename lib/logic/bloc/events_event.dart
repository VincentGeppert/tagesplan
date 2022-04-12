part of 'events_bloc.dart';

abstract class EventsEvent {}

class SetEventsEvent extends EventsEvent {
  List<Event> eventList = <Event>[];

  SetEventsEvent(List<Event> events) {
    eventList = events;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'eventList': eventList.map((x) => x.toMap()).toList()});

    return result;
  }

  factory SetEventsEvent.fromMap(Map<String, dynamic> map) {
    return SetEventsEvent(
      List<Event>.from(map['eventList']?.map((x) => Event.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SetEventsEvent.fromJson(String source) =>
      SetEventsEvent.fromMap(json.decode(source));
}

class AddEventsEvent extends EventsEvent {
  Event eventEvent = Event();

  AddEventsEvent(Event event) {
    eventEvent = event;
  }

  Map<String, dynamic> toMap() {
    return eventEvent.toMap();
  }

  factory AddEventsEvent.fromMap(Map<String, dynamic> map) {
    return AddEventsEvent(
      Event.fromMap(map),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddEventsEvent.fromJson(String source) =>
      AddEventsEvent.fromMap(json.decode(source));
}

class UpdateEventsEvent extends EventsEvent {
  Event eventEvent = Event();

  UpdateEventsEvent(Event event) {
    eventEvent = event;
  }

  Map<String, dynamic> toMap() {
    return eventEvent.toMap();
  }

  factory UpdateEventsEvent.fromMap(Map<String, dynamic> map) {
    return UpdateEventsEvent(
      Event.fromMap(map),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateEventsEvent.fromJson(String source) =>
      UpdateEventsEvent.fromMap(json.decode(source));
}

class DeleteEventsEvent extends EventsEvent {
  Event eventEvent = Event();

  DeleteEventsEvent(Event event) {
    eventEvent = event;
  }

  Map<String, dynamic> toMap() {
    return eventEvent.toMap();
  }

  factory DeleteEventsEvent.fromMap(Map<String, dynamic> map) {
    return DeleteEventsEvent(
      Event.fromMap(map),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteEventsEvent.fromJson(String source) =>
      DeleteEventsEvent.fromMap(json.decode(source));
}
