


import 'dart:io';
import 'dart:async'; // Import the dart:async library for Timer

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hymn/providers/favorite.dart';
import 'package:hymn/providers/history.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class MyPdfViewer extends StatefulWidget {
  final String pdfPath, number, hymn, type;
  final int index;

  MyPdfViewer({
    required this.pdfPath,
    required this.number,
    required this.hymn,
    required this.type,
    required this.index,
  });

  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  bool isLandscape = false;
  late HistoryProvider historyProvider;
  Timer? _timer; // Timer to track the time spent in the widget

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _timer = Timer(Duration(minutes: 1,seconds: 30), () {
      historyProvider.addHymn(
        widget.type + " (" + widget.number + ")",
        widget.hymn,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    historyProvider = Provider.of<HistoryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.pdfPath);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: isLandscape
          ? null
          : AppBar(
              backgroundColor: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
              actions: [
                IconButton(
                  onPressed: () async {
                    Fluttertoast.showToast(
                        msg: "Downloading.... ${widget.type} ${widget.number} ",
                        toastLength: Toast.LENGTH_LONG,
                        backgroundColor: Colors.grey.shade600);
                    String downloadPath = '/storage/emulated/0/Pictures';

                    try {
                      ByteData byteData = await rootBundle.load(widget.pdfPath);
                      File audioFile = File(
                          "$downloadPath/${widget.type}_${widget.number}.jpg");
                      await audioFile.writeAsBytes(byteData.buffer.asUint8List());

                      await Future.delayed(Duration(seconds: 4));
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                "${widget.type} ${widget.number} အား downပြီးပါပြီ!\n သင့်ဖုန်း၏ storage/Documents/ အောက်တွင်ကြည့်ပါ"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text("Error downloading image!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icon(
                    Icons.save_alt,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .inversePrimary,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    try {
                      final fileBytes = await rootBundle.load(widget.pdfPath);
                      final tempDir = await getTemporaryDirectory();
                      final tempFile = File(
                          '${tempDir.path}/${widget.type}_${widget.number}.jpg');
                      await tempFile.writeAsBytes(fileBytes.buffer
                          .asUint8List(fileBytes.offsetInBytes,
                              fileBytes.lengthInBytes));
                      await Share.shareFiles([tempFile.path]);
                    } catch (e) {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text("Error Sharing Image!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icon(
                    Icons.share,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .inversePrimary,
                  ),
                ),
                SizedBox(width: 20),
                favoriteProvider.containInFavorite(
                        widget.type + " (" + widget.number + ")")
                    ? IconButton(
                        onPressed: () {
                          favoriteProvider.removeHymn(
                              widget.type + " (" + widget.number + ")");
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                    : IconButton(
                        onPressed: () {
                          favoriteProvider.addHymn(
                              widget.type + " (" + widget.number + ")",
                              widget.hymn);
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .inversePrimary,
                        )),
                SizedBox(width: 20),
              ],
            ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.1,
          maxScale: 4.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              widget.pdfPath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: _toggleOrientation,
        icon: Icon(color: Colors.black, Icons.screen_rotation),
      ),
    );
  }

  void _toggleOrientation() {
    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    setState(() {
      isLandscape = !isLandscape;
    });
  }

  @override
  void dispose() {
    // Cancel the timer if the widget is disposed before 1 minute
    _timer?.cancel();

    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    super.dispose();
  }
}
