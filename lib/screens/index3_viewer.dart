import 'package:flutter/material.dart';

class Index3Viewer extends StatefulWidget {
  const Index3Viewer({super.key});

  @override
  _Index3ViewerState createState() => _Index3ViewerState();
}

class _Index3ViewerState extends State<Index3Viewer> {
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
                    Image.asset('asset/pdfs/index3-images-0.jpg'),
                    Image.asset('asset/pdfs/index3-images-1.jpg'),
                    Image.asset('asset/pdfs/index3-images-2.jpg'),
                    Image.asset('asset/pdfs/index3-images-3.jpg'),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
