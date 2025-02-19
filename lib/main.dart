import 'package:flutter/material.dart'; 
import 'package:hymn/providers/favorite.dart';
import 'package:hymn/providers/history.dart';
import 'package:hymn/screens/splash.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart';

 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
 runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider(create: (_) => HistoryProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash()
    );
  }
}



