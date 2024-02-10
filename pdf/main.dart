/*

  pdf: ^3.10.7  # for pdf
  open_filex: ^4.4.0 # to open file 
  path_provider: ^2.1.2 # it's to get directory /folder for storing
  path: ^1.8.3 # this is for path joining
  printing: ^5.11.1 # this give customization thing for pdf


// create a folder in root assets and and image logo.png


*/



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart'
    as pw; // imported pdf widget as pw , so that it doesn't conflict with material widget
import 'package:printing/printing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*


Hey Everyone  today we are going to see how to create PDF 

let's start with plugins

i have also added a logo png



UI is just a button 
on click of that we are calling a method createPDf



Thanks for Watching

  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            createPDF();
          },
          child: const Text("Create PDF"),
        ),
      ),
    );
  }

  createPDF() async {
    // creating pdf is really simple
    var logo = (await rootBundle.load('assets/logo.png')).buffer.asUint8List();
    final doc = pw.Document(); // create doc
    final fontFamily = await PdfGoogleFonts.poppinsRegular(); // custom fonts
    doc.addPage(
      // add page
      //  if you want to add multi page
      //
      // that's it for multi page
      // when you use multi page you also get option for header and footer
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
            fontSize: 10,
            font: fontFamily,
            color: PdfColor.fromHex("#444444"),
          ),
        ), // theme for whole doc file
        footer: (context) => pw.Container(
          child: pw.Text("Footer"),
        ),
        header: (context) => pw.Container(
          child: pw.Text("Header"),
        ), // you can create UI as you like , i am just  writing these
        build: (context) {
          // here you have to create your UI / PDF content same as you do in screen here with PDF widgets
          return [
            // it takes list
            pw.Column(
              // pdf only contains image and text as you can see
              children: [
                pw.Image(
                  pw.MemoryImage(logo), // for image
                  height: 60,
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  "Flutter is an open-source UI software development toolkit created by Google, which enables developers to build natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language and offers a rich set of pre-built widgets, allowing developers to create stunning, expressive, and flexible user interfaces. With its hot reload feature, developers can see changes in real-time, making the development process more efficient and productive. Flutter's reactive framework helps to create smooth animations and transitions, providing a delightful user experience across different platforms. Its popularity continues to grow rapidly among developers due to its fast development cycle, excellent performance, and ability to target multiple platforms with a single codebase.",
                ),
              ],
            )
          ];
        },
      ),
    );

    final dir = await getTemporaryDirectory(); // get temperary dir
    const fileName = "sample.pdf";
    final savePath = path.join(dir.path, fileName);
    final file = File(savePath);
    await file.writeAsBytes(await doc.save()); // saving content in file
    OpenFilex.open(file.path); // OPEN FILEX to open this PDF
  }
}

// that's it
// let's see
