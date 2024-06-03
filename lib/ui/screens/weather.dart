import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey = 'e10f5ee8a5b33d27e09a3819c0e32760';
  String selectedCity = 'Almaty';

  Future<Map<String, dynamic>> fetchWeatherData(String city) async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  String generatePlantCareRecommendation(int cloudiness, double humidity) {
    if (humidity > 70) {
      if (cloudiness > 50) {
        return 'High humidity and high cloudiness: Make sure your plants are not standing in water puddles and have sufficient lighting.';
      } else {
        return 'High humidity and low cloudiness: Your plants may need additional watering, considering that sunlight can exacerbate evaporation.';
      }
    } else if (humidity < 30) {
      return 'Low humidity: Your plants may need more frequent watering to retain moisture in the soil.';
    } else {
      if (cloudiness > 50) {
        return 'Medium humidity and high cloudiness: Your plants may not need additional watering, but make sure the soil remains moist.';
      } else {
        return 'Medium humidity and low cloudiness: Your plants need regular watering, considering that sunlight can quickly evaporate water from the soil.';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather for $selectedCity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected City: $selectedCity',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final selected = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CitySelectionPage()),
                );
                if (selected != null) {
                  setState(() {
                    selectedCity = selected;
                  });
                }
              },
              child: Text('Change City'),
            ),
            SizedBox(height: 20),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchWeatherData(selectedCity),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final weatherData = snapshot.data!;
                  final weatherDescription =
                      weatherData['weather'][0]['description'];
                  final temperature =
                      (weatherData['main']['temp'] - 273.15).toStringAsFixed(1);
                  final cloudiness = weatherData['clouds']['all'];
                  final humidity = weatherData['main']['humidity'].toDouble();
                  final windSpeed = weatherData['wind']['speed'];
                  final plantCareRecommendation =
                      generatePlantCareRecommendation(cloudiness, humidity);

                  return Column(
                    children: [
                      Text(
                        'Weather: $weatherDescription',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Temperature: $temperature°C',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cloudiness: $cloudiness%',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Humidity: $humidity%',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Recommendations for caring for plants:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Center(
                        child: Text(
                          plantCareRecommendation,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('No weather data available');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CitySelectionPage extends StatelessWidget {
  final List<String> cities = ['Almaty', 'Astana', 'Kostanay', 'Shymkent'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select City'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return ListTile(
            title: Text(city),
            onTap: () {
              Navigator.pop(context, city);
            },
          );
        },
      ),
    );
  }
}
