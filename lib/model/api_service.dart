import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String streamUrl = "http://192.168.137.104:81/stream";

class APIService {
  static const url = "http://192.168.137.19";
  static const String rightEndPoint = "/right";
  static const leftEndPoint = "/left";
  static const forwardEndPoint = "/forward";
  static const backwardEndPoint = "/backward";
  static const stopFrontWheels = "/stopFrontWheels";
  static const stopBackWheels = "/stopBackWheels";

  Future fetchApi({required String endpoint}) async {
    try {
      http.Response response = await http.get(Uri.parse("$url$endpoint"));
      if (response.statusCode == 200) {
        debugPrint("Success! $endpoint");
      } else {
        print("${response.statusCode} : ${response.body}");
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
