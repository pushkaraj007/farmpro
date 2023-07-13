import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WeatherScreen extends StatelessWidget {
  final String iframeUrl =
      'https://www.meteoblue.com/en/weather/maps/widget/21.206N75.623E223_Asia%2FCalcutta?windAnimation=0&windAnimation=1&gust=0&gust=1&satellite=0&satellite=1&cloudsAndPrecipitation=0&cloudsAndPrecipitation=1&temperature=0&temperature=1&sunshine=0&sunshine=1&extremeForecastIndex=0&extremeForecastIndex=1&geoloc=fixed&tempunit=C&windunit=km%252Fh&lengthunit=metric&zoom=5&autowidth=auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Map'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(iframeUrl),
        ),
      ),
    );
  }
}

