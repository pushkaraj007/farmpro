import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherApiScreen extends StatefulWidget {
  @override
  _WeatherApiScreenState createState() => _WeatherApiScreenState();
}

class _WeatherApiScreenState extends State<WeatherApiScreen> {
  final String apiKey = '4aa36371fc124a6f802130410232506'; // Replace with your weatherapi.com API key
  final TextEditingController _cityController = TextEditingController(text: 'Kingaon');
  WeatherData? weatherData;

  get link => "https://www.weatherapi.com/"; String title="Weather API";

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _searchCity(); // Call the _searchCity method to fetch weather data for the default city
  }
  Future<void> fetchWeatherData(String cityName) async {
    String apiUrl = 'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no';

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          weatherData = WeatherData.fromJson(jsonData);
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _searchCity() {
    String cityName = _cityController.text;
    fetchWeatherData(cityName);
  }

  void _showForecastDetail(ForecastDay forecastDay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Forecast Detail'),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xFFFFFFFF), // Hex value: #66FF33 (green)
          //
          //       Color(0xFF86E591), // Hex value: #3366FF (blue)
          //     ],
          //   ),
          // ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${forecastDay.date}'),
              SizedBox(height: 8.0),
              Text('Max Temperature: ${forecastDay.maxTemperature}°C'),
              Text('Min Temperature: ${forecastDay.minTemperature}°C'),
              Text('Average Temperature: ${forecastDay.avgTemperature}°C'),
              Text('Max Wind Speed: ${forecastDay.maxWindSpeed} km/h'),
              Text('Total Precipitation: ${forecastDay.totalPrecipitation} mm'),
              Text('Average Visibility: ${forecastDay.averageVisibility} km'),
              Text('Average Humidity: ${forecastDay.averageHumidity}%'),
              Text('Daily Chance of Rain: ${forecastDay.dailyChanceOfRain}%'),
              Text('Daily Chance of Snow: ${forecastDay.dailyChanceOfSnow}%'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Weather'),
    ),
    backgroundColor: Colors.transparent,
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF), // Hex value: #66FF33 (green)

            Color(0xFF86E591), // Hex value: #3366FF (blue)
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _searchCity,
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: weatherData != null
                ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'City: ${weatherData!.location}',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Temperature: ${weatherData!.temperature}°C',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Text(
                      'Condition: ${weatherData!.condition}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Text(
                      'Humidity: ${weatherData!.humidity}%',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Text(
                      'Wind Speed: ${weatherData!.windSpeed} km/h',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    // Text(
                    //   'Chances of Rain: ${weatherData!.forecast} km/h',
                    //   style: TextStyle(fontSize: 24.0),
                    // ),
                    SizedBox(height: 24.0),
                    Text(
                      'Forecast:',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: weatherData!.forecast.length,
                      itemBuilder: (context, index) {
                        var forecastDay = weatherData!.forecast[index];
                        return Card(
                          elevation: 50.0,
                          color:  Color(0xFFE7F8E9),
                          child: ListTile(
                            onTap: () {
                              _showForecastDetail(forecastDay);
                            },
                            title: Text(
                              'Date: ${forecastDay.date}',
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Text('Max Temperature: ${forecastDay.maxTemperature}°C'),
                                Text('Min Temperature: ${forecastDay.minTemperature}°C'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
                : Center(
    child: Text(
    'Enter a city name and click Search.\nYour Weather Data will be displayed here',
    style: TextStyle(
    fontSize: 20.0,
    ),
    ),
    ),)
         // Container(
         //   child: Text(
         //
         //     'Powered by $link',
         //     style: TextStyle(
         //       fontSize: 20.0,
         //     ),
         //   ),
         // )

    ],
      ),
    ),

    );
  }
}
class ForecastDay {
  final String date;
  final double maxTemperature;
  final double minTemperature;
  final double avgTemperature;
  final double maxWindSpeed;
  final double totalPrecipitation;
  final double averageVisibility;
  final double averageHumidity;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final String conditionIcon;

  ForecastDay({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.avgTemperature,
    required this.maxWindSpeed,
    required this.totalPrecipitation,
    required this.averageVisibility,
    required this.averageHumidity,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.conditionIcon,
  });

  // String get fullConditionIconUrl {
  //   if (conditionIcon.startsWith('//')) {
  //     return 'https:$conditionIcon';
  //   } else if (conditionIcon.startsWith('http://') || conditionIcon.startsWith('https://')) {
  //     return conditionIcon;
  //   } else {
  //     // Assuming the icon is a local resource, you can replace 'assets/images/' with your actual asset path
  //     return 'assets/images/$conditionIcon';
  //   }
  // }

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var day = json['day'];

    return ForecastDay(
      date: json['date'],
      maxTemperature: day['maxtemp_c'].toDouble(),
      minTemperature: day['mintemp_c'].toDouble(),
      avgTemperature: day['avgtemp_c'].toDouble(),
      maxWindSpeed: day['maxwind_kph'].toDouble(),
      totalPrecipitation: day['totalprecip_mm'].toDouble(),
      averageVisibility: day['avgvis_km'].toDouble(),
      averageHumidity: day['avghumidity'].toDouble(),
      dailyChanceOfRain: day['daily_chance_of_rain'],
      dailyChanceOfSnow: day['daily_chance_of_snow'],
      conditionIcon: day['condition']['icon'],
    );
  }
}

class WeatherData {
  final String location;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;
  final List<ForecastDay> forecast;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var current = json['current'];
    var location = json['location'];
    var forecastJson = json['forecast']['forecastday'] as List<dynamic>;
    var forecast = forecastJson.map((data) => ForecastDay.fromJson(data)).toList();

    return WeatherData(
      location: location['name'],
      temperature: current['temp_c'].toDouble(),
      condition: current['condition']['text'],
      humidity: current['humidity'],
      windSpeed: current['wind_kph'].toDouble(),
      forecast: forecast,
    );
  }
}
