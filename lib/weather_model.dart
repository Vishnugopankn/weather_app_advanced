class Weather{
  double temperature_c;
  double temperature_f;
  String condition;
  double latitude;
  double longitude;
  double windspeed;
  int humidity;
  String Winddirection;
  int cloud;
  double pressure_in;
  double feelslike_c;
  String localtime;
  String place;

  Weather({
    this.temperature_c=0,
    this.temperature_f=0,
    this.condition='clear',
    this.latitude=0,
    this.longitude=0,
    this.windspeed=0,
    this.humidity=0,
    this.Winddirection="WSW",
    this.cloud=0,
    this.pressure_in=0,
    this.feelslike_c=0,
    this.localtime='2023-02-02 5:09',
    this.place="Kozhikode"
  });

  factory Weather.fromJson(Map<String,dynamic> json){
    return Weather(
        temperature_c: json["current"]["temp_c"],
        temperature_f: json["current"]["temp_f"],
        condition: json["current"]["condition"]["text"],
        latitude: json["location"]["lat"],
        longitude:json["location"]["lon"],
        windspeed: json["current"]["wind_kph"],
        humidity: json["current"]["humidity"],
        Winddirection: json["current"]["wind_dir"],
        cloud: json["current"]["cloud"],
        pressure_in: json["current"]["pressure_in"],
        feelslike_c: json["current"]["feelslike_c"],
        localtime: json["location"]["localtime"],
        place: json["location"]["name"]
    );
  }
}