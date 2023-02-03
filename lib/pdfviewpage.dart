import 'dart:io';

import 'package:company_profile_pdf/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFpageview extends StatelessWidget {
  final File file;
  const PDFpageview({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE9FEF8),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffE9FEF8),
          toolbarHeight: 109,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: cblack,
            onPressed: () {},
          ),
          title: const Text(
            "Company Profile",
            style: (TextStyle(color: cblack)),
          ),
        ),
        body: PDFView(
          filePath: file.path,
        ),
      ),
    );
  }
}
