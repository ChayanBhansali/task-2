import 'package:flutter/material.dart';
import 'activity/home.dart';
import 'activity/location.dart';
import 'activity/loading.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => loading(),
      '/home': (context) => home(),
      '/location': (context) => location(),
      '/loading': (context) => loading(),
    },
  ));
}

