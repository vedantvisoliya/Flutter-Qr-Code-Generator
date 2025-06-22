import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_generator_app/components/my_button.dart';
import 'package:qr_code_generator_app/download/web_download.dart'
    if (dart.library.html) 'package:qr_code_generator_app/download/web_download_web.dart';

class QrPage extends StatefulWidget {
  final String data;
  final Color? bgColor;
  final Color? qrEyeColor;
  final Color? dataModuleColor;
  final QrEyeShape? qrEyeShape;
  final QrDataModuleShape? qrDataModuleShape;
  const QrPage({
    super.key,
    required this.data,
    this.bgColor,
    this.qrEyeColor,
    this.dataModuleColor,
    this.qrEyeShape,
    this.qrDataModuleShape,
  });

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final GlobalKey _qrKey = GlobalKey();

  Future<void> _downloadQRCode() async {
    try {
      RenderRepaintBoundary boundary =
          _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      await downloadFile(pngBytes, 'qr_code.png');
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Downloading Error.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 35,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "QR Generated",
                      style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 30.0,),
            
                RepaintBoundary(
                  key: _qrKey,
                  child: QrImageView(
                      data: widget.data, // content of the QR
                      version: QrVersions.auto,
                      size: 200.0,
                      // backgroundColor: widget.bgColor ?? Colors.transparent,
                      // eyeStyle: QrEyeStyle(
                      //   color: Colors.orangeAccent,
                      //   eyeShape: QrEyeShape.square
                      // ),
                      // dataModuleStyle: QrDataModuleStyle(
                      //   color: Colors.orange,
                      //   dataModuleShape: QrDataModuleShape.square,
                      // ),
                  ),
                ),

                const Spacer(),

                MyButton(
                  onTap: () => _downloadQRCode(), 
                  text: "Download QR Code",
                ),
        
                const SizedBox(height: 20.0,),
        
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: MyButton(
                    onTap: () {
                      Navigator.pop(context);
                    }, 
                    text: "Generate Again",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}