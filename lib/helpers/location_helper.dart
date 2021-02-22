import 'dart:convert';

import 'package:http/http.dart' as http;

const mapboxToken =
    'pk.eyJ1Ijoic2lkbWlyemE0IiwiYSI6ImNrbDBubGFwdTA5c3oyb280MmJnaWN1ODQifQ.jcS_n1jSU9Q3hHNcka9vDA';

class LocationHelper {
  static getStaticMap({
    double lat,
    double long,
  }) {
    return 'https://api.mapbox.com/styles/v1/mapbox/light-v10/static/pin-s-l+444($long,$lat)/$long,$lat,13,0,60/600x600?access_token=$mapboxToken';
  }

  static Future<String> getPlaceAddress(
    double lat,
    double lng,
  ) async {
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=$mapboxToken';

    final response = await http.get(url);
    return json.decode(response.body)['features'][0]['place_name'];
  }
}
