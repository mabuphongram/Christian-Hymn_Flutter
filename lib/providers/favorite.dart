import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, String> favorite = {};

  // Initialize and load preferences
  FavoriteProvider() {
    _loadPreferences();
  }

  // Load preferences asynchronously
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadFavoriteFromPrefs();
  }

  // Load favorite map from shared preferences
  void _loadFavoriteFromPrefs() {
    final String favoriteJson = _prefs.getString('favorite') ?? '{}';
    favorite = Map<String, String>.from(jsonDecode(favoriteJson));
    notifyListeners();
  }

  // Save favorite map to shared preferences
  void _saveFavoriteToPrefs() {
    final String favoriteJson = jsonEncode(favorite);
    _prefs.setString('favorite', favoriteJson);
  }

  // Get all favorite hymns
  Map<String, String> getAllFavoriteHymns() {
    return favorite;
  }

  // Check if key exists in favorite
  bool containInFavorite(String key) {
    return favorite.containsKey(key);
  }

  // Add hymn to favorite
  void addHymn(String key, String hymn) {
    favorite[key] = hymn;
    _saveFavoriteToPrefs(); // Save changes to preferences
    notifyListeners();
  }

  // Remove hymn from favorite
  void removeHymn(String key) {
    favorite.remove(key);
    _saveFavoriteToPrefs(); // Save changes to preferences
    notifyListeners();
  }
}
