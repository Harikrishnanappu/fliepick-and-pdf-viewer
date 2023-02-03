import 'dart:io';

import 'package:company_profile_pdf/constants.dart';
import 'package:company_profile_pdf/pdfviewpage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfilePdf extends StatefulWidget {
  const ProfilePdf({super.key});

  @override
  State<ProfilePdf> createState() => _ProfilePdfState();
}

class _ProfilePdfState extends State<ProfilePdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            color: cblack,
            onPressed: () async {
              final file = await pickFile();
              if (file == null) return;
              openPdf(
                context,
                file,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return null;
    return File(result.paths.first ?? '');
  }

  void openPdf(
    BuildContext context,
    File file,
  ) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PDFpageview(
            file: file,
          ),
        ),
      );
}
