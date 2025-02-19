import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hymn/providers/favorite.dart';
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
  late PDFViewController pdfViewController;
  bool isLandscape = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
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
                          msg:
                              "Downloading.... ${widget.type} ${widget.number} ",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.grey.shade600);
                      String downloadPath = '/storage/emulated/0/Pictures';

                      try {
                        // Load the audio file from assets
                        ByteData byteData =
                            await rootBundle.load(widget.pdfPath);

                        // Create a file in the download directory
                        File audioFile = File(
                            "$downloadPath/${widget.type}_${widget.number}.jpg");

                        // Write the audio file to the download directory
                        await audioFile
                            .writeAsBytes(byteData.buffer.asUint8List());

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

                        // // Show toast
                        // Fluttertoast.showToast(
                        //     msg: "Downloaded Hymn ${widget.index}!\n Check out at /storage/emulated/0/Documents",
                        //     toastLength: Toast.LENGTH_LONG,
                        //     backgroundColor: Colors.grey.shade600);
                      } catch (e) {
                        // Handle errors
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text("Error downloading PDF!"),
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
                    )),
                SizedBox(
                  width: 20,
                ),
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
                        print(tempFile.path);
                        // Use the share package to share the temporary file
                        await Share.shareFiles([tempFile.path]);
                      } catch (e) {
                        print('Error sharing song: $e');
                      }
                    },
                    icon: Icon(
                      Icons.share,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .inversePrimary,
                    )),
                SizedBox(
                  width: 20,
                ),
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
                SizedBox(
                  width: 20,
                ),
              ],
            ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, // Enable panning
          minScale: 0.1, // Minimum scale factor
          maxScale: 4.0, // Maximum scale factor
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              widget.pdfPath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ), // Replace with your image asset
        ),
      ),
      // PDFView(
      //   filePath: widget.pdfPath,
      //   autoSpacing: true,
      //   enableSwipe: true,
      //   pageSnap: true,
      //   swipeHorizontal: true,
      //   onError: (error) {
      //     print(error);
      //   },
      //   onPageError: (page, error) {
      //     print('$page: ${error.toString()}');
      //   },
      //   onViewCreated: (PDFViewController vc) {
      //     pdfViewController = vc;
      //   },
      // ),
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
}

