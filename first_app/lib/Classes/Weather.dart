class Weather {
  String weather;
  int sunrise;
  int sunset;
  int main;
  int clouds;
  int dt;
  int timezone;
  String name;

  Weather(
      {this.weather,
      this.sunrise,
      this.sunset,
      this.main,
      this.clouds,
      this.dt,
      this.timezone,
      this.name});
// {
// "coord":,
// "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],
// "base":"stations",
// "main":{"temp":276.55,"feels_like":273.07,"temp_min":276.48,"temp_max":277.04,"pressure":993,"humidity":89},
// "visibility":10000,
// "wind":{"speed":2.53,"deg":325},
// "clouds":{"all":100},
// "dt":1609258252,
// "sys":{"type":3,"id":2019646,"country":"GB","sunrise":1609229174,"sunset":1609257536},
// "timezone":0,
// "id":2643743,
// "name":"London",
// "cod":200
// }
  factory Weather.fromJson(Map<Object, dynamic> json) {
    return Weather(
      weather: json['weather'][0]['description'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      main: json['main']['temp'].toInt() - 273,
      clouds: json['clouds']['all'],
      dt: json['dt'],
      timezone: json['timezone'],
      name: json['name'],
    );
  }
}
