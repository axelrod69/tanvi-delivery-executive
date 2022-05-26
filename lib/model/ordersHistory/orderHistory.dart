import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.113:3000/';
  Map<String, dynamic> _orderHistory = {};

  Map<String, dynamic> get orderHistory {
    return {..._orderHistory};
  }

  Future<void> getOrderHistory(String filter) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url =
        Uri.parse(baseUrl + 'api/delivery-executive/order-list/$filter/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    var res = json.decode(response.body);

    _orderHistory = res;

    print('$filter Orders: $_orderHistory');
  }
}
