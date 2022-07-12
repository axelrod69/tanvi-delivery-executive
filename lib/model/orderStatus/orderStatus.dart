import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OrderStatus with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';

  Future<Map<String, dynamic>> postUpdate(String id, String status) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(
        baseUrl + 'api/delivery-executive/order-status-change/customer/');

    final response = await http.post(url,
        body: json.encode({'order_id': id, 'order_status': status}),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    var res = json.decode(response.body);

    return res;
  }
}
