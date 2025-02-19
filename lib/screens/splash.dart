import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hymn/screens/tab.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart'; // Import your home screen widget

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the home page after 5 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TabHome()), // Replace with your home page widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        // Center the content on the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Text(
              'ခရစ်ယာန်ဓမ္မသီချင်း',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 40), // Add some spacing between the text and icon
            Image.asset(
              'asset/images/cross1.webp',
              height: MediaQuery.of(context).size.height * 0.28,
            ),
            // Adjust the size and color of the icon
            SizedBox(
                height:
                    30), // Add some spacing between the icon and the next text
            Text(
              'The Christian Hymn Book',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'This app is released by ',
              style: TextStyle(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .inversePrimary,
              ),
            ),
            SizedBox(height: 4,),
            Text('Mandalay Regional Evangelizing Committee.'),
            SizedBox(height: 50,),

        
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 93, 91, 91),
            ),
            SizedBox(
              height: 10,
            ),
            Text('ခဏစောင့်ပါ...')
          ],
        ),
      ),
    );
  }
}
