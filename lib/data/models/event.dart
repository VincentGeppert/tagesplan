import 'dart:convert';

class Event {
  String? id;
  String? name;
  String? description;
  String? begin;
  String? end;
  String? date;

  Event(
      {this.id, this.name, this.description, this.begin, this.end, this.date});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (begin != null) {
      result.addAll({'begin': begin});
    }
    if (end != null) {
      result.addAll({'end': end});
    }
    if (date != null) {
      result.addAll({'date': date});
    }

    return result;
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      begin: map['begin'],
      end: map['end'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
