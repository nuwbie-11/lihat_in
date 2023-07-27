import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

}