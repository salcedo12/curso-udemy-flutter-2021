import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  dynamic temperature;
  String weatherIcon;
  String cityName;
  String weatherMesage;
  String country;
  String date;
  String timezone;
  String coordinates;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMesage = 'Unable to get weather data';
        cityName = '';
        country = '';
        date = '';
        timezone = '';
        coordinates = '';
        return;
      }
      temperature = weatherData['data'][0]['temp'];
      cityName = weatherData['data'][0]['city_name'];
      int condition = weatherData['data'][0]['weather']['code'];
      country = weatherData['data'][0]['country_code'];
      date = weatherData['data'][0]['datetime'];
      timezone = weatherData['data'][0]['timezone'];
      coordinates = weatherData['data'][0]['wind_cdir_full'];

      print(country);

      weatherIcon = weather.getWeatherIcon(condition);
      weatherMesage = weather.getMessage(temperature);
    });

    // var timeZone = weatherData['data'][0]['timezone'];
    // var description = weatherData['data'][0]['weather']['description'];
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search_rounded,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  '$cityName  $country \n $date',
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  '$weatherMesage',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Text(
                  'time zone: $timezone',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Text(
                  'coordinates: $coordinates',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyleCoor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// var description = decodeData['data'][0]['weather']['description'];
// var weatherData = decodeData['data'][0]['timezone'];
// var temperature = decodeData['data'][0]['temp'];
// String name = decodeData['data'][0]['city_name'];
