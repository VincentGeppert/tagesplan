class Event {
  String? name;
  String? description;
  String? begin;
  String? end;
  String? date;

  Event({this.name, this.description, this.begin, this.end, this.date});

  Event.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    begin = json['begin'];
    end = json['end'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['description'] = description;
    data['begin'] = begin;
    data['end'] = end;
    data['date'] = date;
    return data;
  }
}
