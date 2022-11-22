// import 'package:flutter/material.dart';
//
// class QrPage extends StatelessWidget {
//   const QrPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white70,
//       child: Center(
//         child: Text(
//           "QrPage",
//           style: TextStyle(
//             color: Colors.purple,
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:srs4/bottom_bar.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  Barcode? result;
  String qrcode = '';
  QRViewController? controller;
  bool _flashOn = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child:Container(
                color: Colors.transparent.withOpacity(1),
                // color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // children: [
                  //   IconButton(
                  //     icon: Icon(
                  //       Icons.keyboard_backspace_rounded,
                  //       color: Colors.white,),
                  //     onPressed: () {
                  //       setState(() {
                  //         Navigator.push( context,
                  //           MaterialPageRoute(
                  //             builder: (context) => HomePage(),
                  //           ),
                  //         );
                  //       });
                  //     },)
                  // ],
                ),
              )),
          Expanded(
              flex: 3,
              child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent.withOpacity(1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          child: IconButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {
                                  _flashOn = !_flashOn;
                                });
                              },
                              icon: Icon(
                                _flashOn
                                    ? Icons.flash_on_outlined
                                    : Icons.flash_off_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),

                      Center(
                          child: Text(
                             qrcode,
                            style: TextStyle(color: Colors.purple, fontFamily: 'Montserrat'),)
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (qrcode.isEmpty){
        qrcode = scanData.code!;
        if(qrcode.isNotEmpty){
          this.controller?.pauseCamera();
          print(qrcode);
          setState(() {
            qrcode == result;
            result = scanData;
          });
        }
      }
    });
  }
}