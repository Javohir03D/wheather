class WeatherData {
  Location? location;
  Current? current;

  WeatherData({
    this.location,
    this.current,
  });

  WeatherData copyWith({
    Location? location,
    Current? current,
  }) =>
      WeatherData(
        location: location ?? this.location,
        current: current ?? this.current,
      );

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
  };
}

class Current {
  DateTime? lastUpdated;
  num? tempC;
  num? isDay;
  Condition? condition;
  double? windKph;
  num? humidity;
  num? cloud;

  Current({
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.humidity,
    this.cloud,
  });

  Current copyWith({
    DateTime? lastUpdated,
    num? tempC,
    num? isDay,
    Condition? condition,
    double? windKph,
    num? humidity,
    num? cloud,
  }) =>
      Current(
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windKph: windKph ?? this.windKph,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
      );

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdated: DateTime.tryParse(json["last_updated"]),
    tempC: json["temp_c"],
    isDay: json["is_day"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windKph: json["wind_kph"]?.toDouble(),
    humidity: json["humidity"],
    cloud: json["cloud"],
  );

  Map<String, dynamic> toJson() => {
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_kph": windKph,
    "humidity": humidity,
    "cloud": cloud,
  };
}

class Condition {
  String? text;

  Condition({
    this.text,
  });

  Condition copyWith({
    String? text,
  }) =>
      Condition(
        text: text ?? this.text,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  num? localtimeEpoch;
  DateTime? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    num? localtimeEpoch,
    DateTime? localtime,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tzId: tzId ?? this.tzId,
        localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
        localtime: localtime ?? this.localtime,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: DateTime.tryParse(json["localtime"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}
