import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
  Map<String, dynamic> _orderHistory = {};
  Map<String, dynamic> _orderDetails = {};
  // List<dynamic> _orderList = [];

  Map<String, dynamic> get orderHistory {
    return {..._orderHistory};
  }

  Map<String, dynamic> get orderDetails {
    return {..._orderDetails};
  }

  // List<dynamic> get orderList {
  //   return [..._orderList];
  // }

  Future<void> getOrderHistory(String filter) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url =
        Uri.parse(baseUrl + 'api/delivery-executive/order-list/$filter/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print('Response Code ${response.statusCode}');

    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      _orderHistory = res;

      print('$filter Orders: $_orderHistory');
    } else {
      _orderHistory = {'data': []};
      return;
    }
  }

  Future<void> getItemDetails(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url =
        Uri.parse(baseUrl + 'api/delivery-executive/order-details/$id/');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      _orderDetails = res;
    } else {
      _orderDetails = {'data': {}};
    }
    return;
  }
}
