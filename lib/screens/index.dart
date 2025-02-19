import 'package:flutter/material.dart';
import 'package:hymn/screens/index1_viewer.dart';
import 'package:hymn/screens/index2_viewer.dart';
import 'package:hymn/screens/index3_viewer.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity, // Set the desired width
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.1), // Optional: To add some padding
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Index1Viewer(),
                        ));
                  },
                  child: Text(
                    'အကြောင်းအရာမာတိကာ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity, // Set the desired width
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.1), // Optional: To add some padding
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Index2Viewer(),
                        ));
                  },
                  child: Text(
                    'သီချင်းခေါင်းစဉ်',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity, // Set the desired width
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.1), // Optional: To add some padding
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Index3Viewer(),
                        ));
                  },
                  child: Text(
                    'Index of Hymn Titles',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
