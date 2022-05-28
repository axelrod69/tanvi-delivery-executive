import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLocationProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.114:3000/';
  Map<String, dynamic> _locationDetails = {};

  Map<String, dynamic> get locationDetails {
    return {..._locationDetails};
  }

  Future<Map<String, dynamic>> postLocation(
      double latitude, double longitude, String status) async {
    print('API Status: $status');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/delivery-executive/live/location/');
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'live_map_lat': latitude.toString(),
          'live_map_lng': longitude.toString(),
          'live_status': status
        }));

    var res = json.decode(response.body);

    return res;
  }

  Future<void> getLocationDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/delivery-executive/live/location/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    var res = json.decode(response.body);
    _locationDetails = res;

    print('Live Location Details: $_locationDetails');
  }
}
