import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tagesplan/data/models/event.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, List<Event>> with HydratedMixin {
  EventsBloc(List<Event> events) : super(events) {
    on<SetEventsEvent>((event, emit) => event.eventList);
    on<AddEventsEvent>(
        (event, emit) => List.from(events).add(event.eventEvent));
    on<UpdateEventsEvent>((event, emit) {
      List<Event> newState = List.from(events);
      int index;
      newState.forEach((element) {if (element.) {
        
      }});
    });
  }
}
