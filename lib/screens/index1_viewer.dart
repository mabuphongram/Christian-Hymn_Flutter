import 'package:flutter/material.dart';

class Index1Viewer extends StatefulWidget {
  const Index1Viewer({super.key});

  @override
  _Index1ViewerState createState() => _Index1ViewerState();
}

class _Index1ViewerState extends State<Index1Viewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
            panEnabled: true, // Enable panning
            minScale: 0.1, // Minimum scale factor
            maxScale: 4.0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Image.asset('asset/pdfs/index1-1.jpg'),
                    Image.asset('asset/pdfs/index1-2.jpg'),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
