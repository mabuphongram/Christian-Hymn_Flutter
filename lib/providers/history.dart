import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, Map<String, String>> history = {};
  List<String> _keysOrder = [];

  HistoryProvider() {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    _prefs = await SharedPreferences.getInstance();
    _loadHistoryFromPrefs();
  }

  void _loadHistoryFromPrefs() {
    final String historyJson = _prefs.getString('history') ?? '{}';
    final Map<String, dynamic> decodedHistory = jsonDecode(historyJson);

    history = decodedHistory.map((key, value) {
      if (value is Map<String, dynamic>) {
        return MapEntry(key, Map<String, String>.from(value));
      } else {
        return MapEntry(key, {});
      }
    });

    final String keysOrderJson = _prefs.getString('keysOrder') ?? '[]';
    _keysOrder = List<String>.from(jsonDecode(keysOrderJson));

    notifyListeners();
  }

  void _saveHistoryToPrefs() {
    final String historyJson = jsonEncode(history);
    _prefs.setString('history', historyJson);

    final String keysOrderJson = jsonEncode(_keysOrder);
    _prefs.setString('keysOrder', keysOrderJson);
  }

  Map<String, Map<String, String>> getAllHistoryHymns() {
    return history;
  }

  bool containInHistory(String key) {
    return history.containsKey(key);
  }

  void addHymn(String key, String hymn) {
    String date = _getCurrentFormattedDate();

    if (history.containsKey(key)) {
      // Move the existing item to the latest position
      _keysOrder.remove(key);
      history.remove(key);
    } else {
      // Remove the oldest item if the list exceeds 5 items
      if (_keysOrder.length >= 20) {
        String oldestKey = _keysOrder.removeAt(0);
        history.remove(oldestKey);
      }
    }
    // Add the new or moved item to the latest position
    _keysOrder.add(key);
    history[key] = {'hymn': hymn, 'date': date};

    _saveHistoryToPrefs();
    notifyListeners();
  }

  String _getCurrentFormattedDate() {
    final now = DateTime.now();
    return '${_getWeekdayName(now.weekday)}, ${now.day} ${_getMonthName(now.month)} ${now.year}';
  }

  String _getWeekdayName(int weekday) {
    const weekdays = [
      'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
    ];
    return weekdays[weekday - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
  void removeHymn(String key) {
  if (history.containsKey(key)) {
    // Remove the key from the _keysOrder list
    _keysOrder.remove(key);

    // Remove the key from the history map
    history.remove(key);

    // Save the updated history to SharedPreferences
    _saveHistoryToPrefs();
    
    // Notify listeners about the change
    notifyListeners();
  }
}

}
