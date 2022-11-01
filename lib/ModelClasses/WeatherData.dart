// ignore_for_file: file_names

class WeatherData {
  Location? location;
  Current? current;

  WeatherData({this.location, this.current});

  WeatherData.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }
}

class Location {
  String? name;

  Location({this.name});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Current {
  double? tempC;
  double? tempF;
  Condition? condition;

  Current({this.tempC, this.tempF, this.condition});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}
