// ignore_for_file: always_specify_types
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

//Plugin that allows Flutter apps to generate and print documents to android or ios compatible printers

//void main() => runApp(MyApp());

class PrintingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Printing Demo';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image(
              image: new AssetImage("images/test_icon.png"),
            ),
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: _printDocument,
            ),
          ],
        )),
      ),
    );
  }

  Future<PdfImage> _getImage() async {
    const imageProvider = const AssetImage('images/test_icon.png');
    PdfImage image = await pdfImageFromImageProvider(
        pdf: pw.Document().document, image: imageProvider);
    return image;
  }

  void _printDocument() {
    _getImage().then((value) => {
          Printing.layoutPdf(
            onLayout: (pageFormat) {
              final doc = pw.Document();

              doc.addPage(pw.Page(build: (pw.Context context) {
                return pw.Center(
                  child: pw.Image(value),
                ); // Center
              })); // Page

              doc.addPage(
                pw.Page(
                  build: (pw.Context context) => pw.Center(
                    child: pw.Text('Hello World!'),
                  ),
                ),
              );

              return doc.save();
            },
          )
        });
  }
}
