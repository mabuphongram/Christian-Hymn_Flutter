import 'package:flutter/material.dart';

class Index2Viewer extends StatefulWidget {
  const Index2Viewer({super.key});

  @override
  _Index2ViewerState createState() => _Index2ViewerState();
}

class _Index2ViewerState extends State<Index2Viewer> {
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
                    Image.asset('asset/pdfs/index2-1.jpg'),
                    Image.asset('asset/pdfs/index2-2.jpg'),
                    Image.asset('asset/pdfs/index2-3.jpg'),
                    Image.asset('asset/pdfs/index2-4.jpg'),
                    Image.asset('asset/pdfs/index2-5.jpg'),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
